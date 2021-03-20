use strict;
use warnings;
use utf8;
use Encode 'encode', 'decode';
use JSON::PP 'encode_json', 'decode_json';

# CSVファイルを読み込んでPerlのデータ構造を作成する
my $books = [];
while (my $line = <>) {
  # 1行目のヘッダを飛ばす $.は行番号
  if ($. == 1) {
    next;
  }
  
  # 改行の削除(Windows, Mac, Linux/UNIX対応)
  $line =~ s/\r?\n//;
  
  # Perlの内部文字列へ変換
  $line = decode('UTF-8', $line);

  # CSVデータをPerlの変数へ
  my ($id, $name, $author_name, $price, $issued_date)
    = split(/,/, $line);
  
  # 価格を20% off
  my $price_off = $price * 0.8;
  
  # 発行日の日付を
  #「2021年1年3日」のようなフォーマットから「2021-01-03」のようなフォーマットへ
  my $issued_date_hyphen;
  if ($issued_date =~ /^(\d+)年(\d+)月(\d+)日$/) {
    my $year = $1;
    my $mon = $2;
    my $mday = $3;
    
    $issued_date_hyphen = sprintf("%04d-%02d-%02d", $year, $mon, $mday);
  }
  else {
    # フォーマットが間違っている場合は、警告を出して、次の処理へ
    # $. には行番号が含まれている
    warn("Invalid issued date format at line $.");
    next;
  }
  
  # 条件にマッチしたときだけ追加
  # 検索条件は「書名が『モジガエル』で始まる、あるいは『Webシステム開発』で終わる」
  # かつ「発売日が2020年以降」
  my $match;
  if (
    ($name =~ /^モジガエル/ || $name =~ /Webシステム開発$/)
    && $issued_date_hyphen ge '2020'
  ) {
    # マッチ
    $match = 1;
  }
  
  # マッチした場合は追加
  if ($match) {
    # 書籍情報を作成
    my $book = {
      id => $id,
      name => $name,
      author_name => $author_name,
      price => $price_off,
      issued_date => $issued_date_hyphen,
    };
    
    # 書籍を配列のリファレンスの最後の要素に追加
    push @$books, $book;
  }
}

# データの中身をダンプしてみたい場合
# Windows
# use D;dw $books;
# Mac, Linux/UNIX
# use D;du $books;

# Perlのデータ構造をJSONデータへ変換
my $books_json = encode_json $books;

# JSONデータを出力
print $books_json;

use strict;
use warnings;
use utf8;
use Encode 'encode', 'decode';

# DATAセクションから行を一行ずつ読み込む
while (my $line = <>) {

  # 一行目は読み飛ばす($.はファイルの行番号。nextで次のループの先頭へ)
  if ($. == 1) { next }

  # PerlのUTF-8を内部文字列へデコード
  $line = decode('UTF-8', $line);
  
  # 改行を削除
  chomp $line;

  # カンマで分割して各変数へ
  my ($id, $name, $author, $price, $issued_date) = split(/,/, $line);
  
  # 正規表現で発売日の年の部分を取得
  my $issued_year;
  if ($issued_date =~ /^(\d{4})/) {
    $issued_year = $1;
  }
  
  # 出版年を取得できた場合のみ処理
  if (defined $issued_year) {
    # 出版年が2018年～2019年まで
    if ($issued_year >= 2018 && $issued_year <= 2019) {
      # 出力行を作成
      my $output_line = join(',', $id, $name, $author, $price, $issued_date);

      # Perlの内部文字列をUTF-8にエンコードして出力
      print encode('UTF-8', $output_line) . "\n";
    }
  }
}

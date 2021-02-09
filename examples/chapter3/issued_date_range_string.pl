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
  
  # 2018年1月1日から2019年12月31の間に発売された
  if ($issued_date ge '2018-01-01' && $issued_date le '2019-12-31') {
    # 出力行を作成
    my $output_line = join(',', $id, $name, $author, $price, $issued_date);

    # Perlの内部文字列をUTF-8にエンコードして出力
    print encode('UTF-8', $output_line) . "\n";
  }
}

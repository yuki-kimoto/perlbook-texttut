# contain_perl.pl
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
  
  if ($name =~ /Perl/) {
    # 出力行を作成
    my $output_line = join(',', $id, $name, $author, $price, $issued_date);
    
    # Perlの内部文字列をUTF-8にエンコードして出力
    print encode('UTF-8', $output_line) . "\n";
  }
}

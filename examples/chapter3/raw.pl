# raw.pl
use strict;
use warnings;
use utf8;
use Encode 'encode', 'decode';

# DATAセクションから行を一行ずつ読み込む
while (my $line = <>) {

  # 一行目はヘッダ行なので、そのまま出力
  if ($. == 1) {
    print $line;
  }
  else {
    # PerlのUTF-8を内部文字列へデコード
    $line = decode('UTF-8', $line);
    
    # 改行を削除
    chomp $line;
  
    # カンマで分割して各変数へ
    my ($id, $name, $author, $price, $issued_date) = split(/,/, $line);
    
    # 出力するための配列を作成
    my @output_items = ($id, $name, $author, $price, $issued_date);
    
    # 出力行を作成
    my $output_line = join(',', @output_items);
    
    # Perlの内部文字列をUTF-8にエンコードして出力
    print encode('UTF-8', $output_line) . "\n";
  }
}

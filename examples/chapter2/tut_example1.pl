use strict;
use warnings;
use utf8;
use Encode 'encode', 'decode';

# 引数に指定したファイルから行を一行ずつ読み込む
while (my $line = <>) {
  
  # PerlのUTF-8を内部文字列へデコード
  $line = decode('UTF-8', $line);
  
  # 改行を削除
  chomp $line;
  
  # カンマで分割して配列へ
  my @items = split(/,/, $line);
  
  # 本の情報をハッシュへ保存
  my %book;
  $book{id} = $items[0];
  $book{name} = $items[1];
  $book{author} = $items[2];
  $book{price} = $items[3];
  
  # 著者名に田中が含まれていたら
  if ($book{author} =~ /田中/) {
    
    # 書名の入門を基礎に置換
    $book{name} =~ s/入門/基礎/;
    
    # 出力するための配列を作成
    my @output_items = ($book{id}, $book{name}, $book{author}, $book{price});
    
    # 出力行を作成
    my $output_line = join(',', @output_items);
    
    # Perlの内部文字列をUTF-8にエンコードして出力
    print encode('UTF-8', $output_line) . "\n";
  }
}

use strict;
use warnings;

# カンマ区切りのデータ
my $csv = '1,Perl,Mojigaeru,2900';

# カンマ区切りのデータを配列に変換
my @items = split(/,/, $csv);

# 配列の内容を出力
for my $item (@items) {
  print "$item\n";
}

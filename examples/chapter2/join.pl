use strict;
use warnings;

# 配列
my @items = (1, 'Perl', 'Mojigaeru', 2900);

# join関数で、カンマで連結してCSVデータに変換
my $csv = join(',', @items);

print "$csv\n";

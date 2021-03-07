use strict;
use warnings;
use utf8;

# 実際のデータ
my @nums = (3, 5, 9);

# 配列リファレンスを作成
my $nums_ref = \@nums;

# 中身を表示してみるとどうなる?
print "$nums_ref\n";

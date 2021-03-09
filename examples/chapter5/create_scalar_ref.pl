use strict;
use warnings;

# 実際のデータ
my $name = "kimoto";

# リファレンスを作成
my $name_ref = \$name;

# 中身を表示してみるとどうなる?
print "$name_ref\n";

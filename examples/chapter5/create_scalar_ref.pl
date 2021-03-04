use strict;
use warnings;
use utf8;

# 実際のデータ
my $name = "モジガエル";

# リファレンスを作成
my $name_ref = \$name;

# 中身を表示してみるとどうなる?
print "$name_ref\n";

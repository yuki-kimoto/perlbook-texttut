use strict;
use warnings;

# 実際のデータ
my $name = "kimoto";

# リファレンスを作成
my $name_ref = \$name;

# スカラのデリファレンスして実体を取り出す
my $name_deref = ${$name_ref};

# 中身を表示してみるとどうなる? 元に戻っていますね。
print "$name_deref\n";

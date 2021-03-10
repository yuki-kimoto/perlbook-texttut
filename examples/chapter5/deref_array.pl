use strict;
use warnings;

# 実際のデータ
my @nums = (3, 5, 9);

# 配列リファレンスを作成
my $nums_ref = \@nums;

# 配列のデリファレンス
my @nums_deref = @{$nums_ref};

# 中身を表示してみるとどうなる? 元に戻っていますね。
print "@nums_deref\n";

use strict;
use warnings;

# 配列のリファレンスを作成
my $nums = [3, 5, 7];

# 配列のリファレンスから要素を取得
my $num = $nums->[2];

print "$num\n";

# 配列のリファレンスから要素を設定
$nums->[1] = 10;

# 配列のリファレンスをデリファレンスして出力
print "@$nums\n";

use strict;
use warnings;

# Data::Dumperモジュールを読み込み
use Data::Dumper;

# 配列のリファレンス
my $nums = [3, 5, 6];

# 配列のリファレンスのデータをダンプする
warn Dumper $nums;

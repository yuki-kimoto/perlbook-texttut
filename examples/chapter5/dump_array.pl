use strict;
use warnings;

# Data::Dumperモジュールを読み込み
use Data::Dumper;

# 配列
my @nums = (3, 5, 6);

# 配列のデータをダンプする
warn Dumper \@nums;

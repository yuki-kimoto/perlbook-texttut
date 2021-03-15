use strict;
use warnings;

# Data::Dumperモジュールを読み込み
use Data::Dumper;

# ハッシュのリファレンス
my $book = {id => 1, name => 'Perl Book'};

# ハッシュのリファレンスのデータをダンプする
warn Dumper $book;

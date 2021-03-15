use strict;
use warnings;

# Data::Dumperモジュールを読み込み
use Data::Dumper;

# ハッシュ
my %book = (id => 1, name => 'Perl Book');

# ハッシュのデータをダンプする
warn Dumper \%book;

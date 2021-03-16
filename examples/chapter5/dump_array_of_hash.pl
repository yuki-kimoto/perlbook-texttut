use strict;
use warnings;
use Data::Dumper;

# Perlでハッシュの配列というデータ構造を表現
# 配列のリファレンスとハッシュのリファレンスを使います。
my $books = [
  {
    id => 1,
    name => 'Perl Boook',
    price => 2900,
  },
  {
    id => 2,
    name => 'Web Development',
    price => 2000,
  },
  {
    id => 3,
    name => 'Database',
    price => 1900,
  }
];

warn Dumper $books;

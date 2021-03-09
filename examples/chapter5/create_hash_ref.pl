use strict;
use warnings;

# 実際のデータ
my %book = (id => 1, name => 'Perl Book');

# ハッシュリファレンスを作成
my $book_ref = \%book;

# 中身を表示してみるとどうなる?
print "$book_ref\n";

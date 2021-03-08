use strict;
use warnings;
use utf8;

# 実際のデータ
my %book = (id => 1, name => 'Perlテキスト処理');

# ハッシュリファレンスを作成
my $book_ref = \%book;

# 中身を表示してみるとどうなる?
print "$book_ref\n";

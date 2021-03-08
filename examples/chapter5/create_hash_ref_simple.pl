use strict;
use warnings;
use utf8;

# 無名ハッシュ生成子を使ってハッシュリファレンスを簡単に作成
my $book_ref = {id => 1, name => 'Perlテキスト処理'};

# 中身を表示してみるとどうなる?
print "$book_ref\n";

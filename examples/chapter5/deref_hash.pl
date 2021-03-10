use strict;
use warnings;

# 実際のデータ
my %book = (id => 1, name => 'Perl Book');

# ハッシュリファレンスを作成
my $book_ref = \%book;

# ハッシュのデリファレンスを行って実体を取り出す
my %book_deref = %{$book_ref};

# 中身を表示してみるとどうなる? 元に戻っていますね。
for my $name (sort keys %book_deref) {
  my $value = $book_deref{$name};
  print "$name : $value\n";
}

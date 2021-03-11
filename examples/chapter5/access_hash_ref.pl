use strict;
use warnings;

# ハッシュのリファレンスを作成
my $book = {id => 1, name => 'Perl Book'};

# ハッシュのリファレンスから要素を取得
my $name = $book->{name};

print "$name\n";

# ハッシュのリファレンスから要素を設定
$book->{id} = 2;

# ハッシュのリファレンスをデリファレンスして出力
for my $key (sort keys %$book) {
  my $value = $book->{$key};
  print "$key : $value\n";
}

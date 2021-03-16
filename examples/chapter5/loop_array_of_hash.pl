use strict;
use warnings;
use Data::Dumper;

# 書籍のデータ
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

# 配列のリファレンスをデリファレンスしてforループに渡す
for my $book (@$books) {
  # アロー演算子「->」で値を取得
  my $id = $book->{id};
  my $name = $book->{name};
  my $price = $book->{price};
  
  # 消費税10%を加算
  $book->{price} *= 1.1;
}

# データをダンプする
warn Dumper $books;

use strict;
use warnings;
use utf8;

# JSON::PPを読み込み
# encode_json関数とdecode_json関数をインポートする
use JSON::PP 'encode_json', 'decode_json';

# ファイル全部を読み込む
my $in_json = do { local $/; <> };

# deocde_json関数でJSONデータをPerlのデータ構造に変換
my $books = decode_json $in_json;

for my $book (@$books) {
  # 書籍の情報を取得
  my $id = $book->{id};
  my $name = $book->{name};
  my $price = $book->{price};
  my $issued_date = $book->{issued_date};
  
  # 税込み価格
  my $price_zeikomi = $price * 1.1;
  
  # 税込み価格で書籍の情報を更新
  
  $book->{price} = $price_zeikomi
}

# encode_json関数でPerlのデータ構造をJSONデータに変換
my $out_json = encode_json $books;

# JSONを出力
print $out_json;

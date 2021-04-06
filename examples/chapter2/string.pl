use strict;
use warnings;

# 変数展開を使ってメッセージを作成
my $fruit0 = 'orange';
my $fruit1 = 'banana';
my $fruit2 = 'apple';
my $message = "I like $fruit0, $fruit1, and $fruit2.";

# メッセージの末尾に新しいメッセージを追加
$message = $message . "Hello!";

# 改行をつけて出力
print $message . "\n";

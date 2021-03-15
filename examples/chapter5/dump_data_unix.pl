use strict;
use warnings;
use utf8;

# ハッシュのリファレンス
my $book = {id => 1, name => 'モジガエルのPerl入門'};

# Mac、Linux/UNIXで日本語を含んだPerlのデータをダンプする
use D;du $book;

use strict;
use warnings;
use utf8;

# ハッシュのリファレンス
my $book = {id => 1, name => 'モジガエルのPerl入門'};

# Windowsで日本語を含んだPerlのデータをダンプする
use D;dw $book;

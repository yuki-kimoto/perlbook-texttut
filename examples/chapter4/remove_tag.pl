use strict;
use warnings;
use utf8;
use Encode 'encode';

my $html = '今日は<b>プログラミング</b>を学んで充実した一日。今度は<span style="font-size:18px">Webシステム開発構築</span>を行いたいです。';

# 元のHTMLを残しておくために文字列を置換前にコピーする
my $text = $html;

# <と>で囲まれている部分をすべて削除する
$text =~ s/<.+?>//g;

print encode('UTF-8', "$text\n");

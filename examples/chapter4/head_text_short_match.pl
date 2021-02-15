use strict;
use warnings;
use utf8;
use Encode 'encode';

my $html = '<h1>Linuxサーバー管理入門</h1>まちがえ閉じタグ</h1>';

my $head_text;
if ($html =~ /<h1>(.+?)<\/h1>/) {
  $head_text = $1;
}
print encode('UTF-8', "$head_text\n");

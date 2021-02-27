use strict;
use warnings;
use utf8;
use Encode 'encode', 'decode';

# ファイル全部を読み込む
my $in_html;
{
  local $/ = undef;
  $in_html = <>;
  $in_html = decode('UTF-8', $in_html);
}

# httpまたはhttpsで始まる外部URLをすべて取得
my @urls;
while ($in_html =~ m|href\s*=\s*"(https?://[^"]+)"|g) {
  my $url = $1;
  push @urls, $url;
}

# URLを出力
for my $url (@urls) {
  print encode('UTF-8', "$url\n");
}

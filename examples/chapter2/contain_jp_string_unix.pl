use strict;
use warnings;
use utf8;
use Encode 'encode';

# 著者の名前に木本を含んでいたら「これは木本の著作です。」と画面に出力
my $author_name = '木本裕紀';

if ($author_name =~ /木本/) {
  my $message = "これは木本の著作です";
  print encode('UTF-8', $message) . "\n";
}

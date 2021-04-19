use strict;
use warnings;
use utf8;
use Encode 'encode';

my $text = '   　Linuxサーバー管理入門　  ';

# 先頭から複数の空白を取り除く
$text =~ s/^\s+//;

# 末尾から複数の空白を取り除く
$text =~ s/\s+$//;

print encode('UTF-8', "$text") . "\n";

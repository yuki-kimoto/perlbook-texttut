use strict;
use warnings;
use utf8;
use Encode 'encode', 'decode';

# ファイル全部を読み込む
my $html;
{
  local $/ = undef;
  $html = <>;
  $html = decode('UTF-8', $html);
}

my $text;
if ($html =~ /<p>(.*?)<\/p>/s) {
  $text = $1;
  
  # 先頭の空白文字を削除
  $text =~ s/^\s+//;
  
  # 末尾の空白文字を削除
  $text =~ s/\s+$//;
  
  # 複数の空白文字を一つの空白へ
  $text =~ s/\s+/ /;
}

print encode('UTF-8', "$text\n");

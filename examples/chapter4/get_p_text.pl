use strict;
use warnings;
use utf8;
use Encode 'encode';

my $html = <<'EOS';
  <p>
    今日は、毎週土曜日更新のPerlプログラミングちゃんねるを見ています。
    
    ひげで、坊主のオジサンが雑にしゃべっているのが気になり、講義が頭の中に入ってきません。
  </p>
EOS

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

print encode('UTF-8', "$text") . "\n";

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

# リンゴの色の個数を数える
my %apple_counts;
while ($html =~ /(青|赤|黄)リンゴ/g) {
  my $color = $1;
  
  # 個数を加算
  $apple_counts{$color}++;
}

# リンゴの個数を記述したテキスト
my $apple_counts_str = '';
for my $color (sort keys %apple_counts) {
  my $apple_count = $apple_counts{$color};
  $apple_counts_str .= "${color}リンゴ: ${apple_count}個\n";
}

print encode('UTF-8', "$apple_counts_str\n");

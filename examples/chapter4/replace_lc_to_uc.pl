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

# ファイルの内容を出力用のHTMLにコピー
my $out_html = $in_html;

# すべての小文字を大文字に置換
$out_html =~ s/([a-z]+)/uc $1/eg;

print encode('UTF-8', $out_html);

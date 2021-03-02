use strict;
use warnings;
use utf8;
use Encode 'encode', 'decode';

# ファイル全部を読み込む
my $html = do { local $/; <> };

# ファイルの内容をデコード
$html = decode('UTF-8', $html);

# ファイルの内容を出力
print encode('UTF-8', $html);

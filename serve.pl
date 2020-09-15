use strict;
use warnings;
use utf8;

use Giblog;
use Mojolicious::Lite;

# Build
Giblog->build;

# Mojolicious::Lite Application
my $app = app;

# wkhtmltopdfコマンド
my $wkhtmltopdf_cmd = '/usr/local/bin/wkhtmltopdf';

# ページサイズ
my $page_size = 'A5';

# マージン
my $margin_top = '10mm';
my $margin_bottom = '10mm';
my $margin_left = '10mm';
my $margin_right = '10mm';

# 低品質
my $lowquality = '--lowquality';

my $wkhtmltopdf_cmd_with_opt = "$wkhtmltopdf_cmd $lowquality --page-size $page_size --margin-bottom $margin_bottom --margin-left $margin_left --margin-right $margin_right --margin-top $margin_top";

# HTMLからPDFを作成する関数
sub create_pdf_file {
  my ($wkhtmltopdf_cmd_with_opt, $input_html_file, $output_pdf_file) = @_;
  
  my $wkhtmltopdf_cmd_with_opt_and_args = "$wkhtmltopdf_cmd_with_opt $input_html_file $output_pdf_file";
  
  system($wkhtmltopdf_cmd_with_opt_and_args) == 0
    or die "Can't create PDF file from $input_html_file to $output_pdf_file: $wkhtmltopdf_cmd_with_opt_and_args";
}

# 見開きPDFを作成
create_pdf_file($wkhtmltopdf_cmd_with_opt, 'public/top.html', 'public/top.pdf');

# はじめにPDFを作成
create_pdf_file($wkhtmltopdf_cmd_with_opt, 'public/beginning.html', 'public/beginning.pdf');

# 目次のPDFを作成
create_pdf_file($wkhtmltopdf_cmd_with_opt, 'public/toc.html', 'public/toc.pdf');

# 各章のPDFを作成
for my $chapter_number (1 .. 12) {
  my $chapter_html_file_base = sprintf("chapter%02d.html", $chapter_number);
  my $chapter_pdf_file_base = $chapter_html_file_base;
  $chapter_pdf_file_base =~ s/\.html$/.pdf/;
  
  create_pdf_file($wkhtmltopdf_cmd_with_opt, "public/$chapter_html_file_base", "public/$chapter_pdf_file_base");
}

# Serve
Giblog->serve($app);

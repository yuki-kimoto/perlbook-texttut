use strict;
use warnings;
use FindBin;

use PDF::API2;

my $all_pdf = PDF::API2->new();

# A5サイズ
$all_pdf->mediabox('A5');

# 見開き(ページを偶数にする)
my $top_pdf = PDF::API2->open("$FindBin::Bin/public/top.pdf");
$all_pdf->import_page($top_pdf);
if ($all_pdf->pages % 2 != 0) {
  $all_pdf->page;
}

# はじめに(ページを偶数にする)
my $beginning_pdf = PDF::API2->open("$FindBin::Bin/public/beginning.pdf");
$all_pdf->import_page($beginning_pdf);
if ($all_pdf->pages % 2 != 0) {
  $all_pdf->page;
}

# 第１章(ページを偶数にする)
my $chapter1_pdf = PDF::API2->open("$FindBin::Bin/public/chapter1.pdf");
$all_pdf->import_page($chapter1_pdf);
if ($all_pdf->pages % 2 != 0) {
  $all_pdf->page;
}

# 全体を出力
my $all_pdf_file = "$FindBin::Bin/public/book.pdf";
$all_pdf->saveas($all_pdf_file);

use strict;
use warnings;
use FindBin;

use PDF::API2;

my $all_pdf = PDF::API2->new();
my $top_pdf = PDF::API2->open("$FindBin::Bin/public/top.pdf");
$all_pdf->import_page($top_pdf);

my $beginning_pdf = PDF::API2->open("$FindBin::Bin/public/beginning.pdf");
$all_pdf->import_page($beginning_pdf);

my $all_pdf_file = "$FindBin::Bin/public/book.pdf";
$all_pdf->saveas($all_pdf_file);

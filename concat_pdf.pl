use strict;
use warnings;
use FindBin;

use PDF::API2;

# PDFを結合して完成原稿を作成
concat_pdf();

sub concat_pdf {
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

  # ページ番号を挿入(はじめにから)
  for (my $page_number = 3; $page_number <= $all_pdf->pages; $page_number++) {
    my $font = $all_pdf->corefont('Helvetica');
    my $page = $all_pdf->openpage($page_number);
    my $text_page_number = $page->text();
    $text_page_number->font($font, 10);
    
    # 表示ページ番号
    my $display_page_number = $page_number - 2;

    # 右開き奇数
    if ($display_page_number % 2 != 0) {
      $text_page_number->translate(385, 20);
    }
    # 左開き偶数
    else {
      $text_page_number->translate(30, 20);
    }
    $text_page_number->text($display_page_number);
  }

  # 全体を出力
  my $all_pdf_file = "$FindBin::Bin/public/book.pdf";
  $all_pdf->saveas($all_pdf_file);
}

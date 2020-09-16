use strict;
use warnings;
use FindBin;

use PDF::API2;

# wkhtmltopdfコマンド
my $wkhtmltopdf_cmd = '/usr/local/bin/wkhtmltopdf';

# 最終章
my $chapter_number_last = 11;

# 各ページを作成
create_each_pdf_files();

# PDFを結合して完成原稿を作成
concat_pdf_file();

sub create_each_pdf_files {
  # ページサイズ
  my $page_size = 'A5';

  # マージン
  my $margin_top = '10mm';
  my $margin_bottom = '10mm';
  my $margin_left = '10mm';
  my $margin_right = '10mm';

  # 低品質(これを指定しないと、見出しの文字が正しく描画されないバグがある)
  my $lowquality = '--lowquality';

  my $wkhtmltopdf_cmd_with_opt = "$wkhtmltopdf_cmd $lowquality --page-size $page_size --margin-bottom $margin_bottom --margin-left $margin_left --margin-right $margin_right --margin-top $margin_top";

  # 見開きPDFを作成
  create_pdf_file($wkhtmltopdf_cmd_with_opt, 'public/top.html', 'public/top.pdf');

  # はじめにPDFを作成
  create_pdf_file($wkhtmltopdf_cmd_with_opt, 'public/beginning.html', 'public/beginning.pdf');

  # 目次のPDFを作成
  create_pdf_file($wkhtmltopdf_cmd_with_opt, 'public/toc.html', 'public/toc.pdf');
  
  # 各章の扉を作成
  {
    my $wkhtmltopdf_cmd_with_opt_no_margin = "$wkhtmltopdf_cmd $lowquality --page-size $page_size --margin-bottom 0mm --margin-left 0mm --margin-right 0mm --margin-top 0mm";
    my $chapter_html_file_base = sprintf("chapter%02d_title.html", 1);
    my $chapter_pdf_file_base = $chapter_html_file_base;
    $chapter_pdf_file_base =~ s/\.html$/.pdf/;
    create_pdf_file($wkhtmltopdf_cmd_with_opt_no_margin, "public/$chapter_html_file_base", "public/$chapter_pdf_file_base");
  }
  
    
  # 各章のPDFを作成
  for my $chapter_number (1 .. $chapter_number_last) {
    my $chapter_html_file_base = sprintf("chapter%02d.html", $chapter_number);
    my $chapter_pdf_file_base = $chapter_html_file_base;
    $chapter_pdf_file_base =~ s/\.html$/.pdf/;
    
    create_pdf_file($wkhtmltopdf_cmd_with_opt, "public/$chapter_html_file_base", "public/$chapter_pdf_file_base");
  }
}

# HTMLからPDFを作成する関数
sub create_pdf_file {
  my ($wkhtmltopdf_cmd_with_opt, $input_html_file, $output_pdf_file) = @_;
  
  my $wkhtmltopdf_cmd_with_opt_and_args = "$wkhtmltopdf_cmd_with_opt $input_html_file $output_pdf_file";
  
  system($wkhtmltopdf_cmd_with_opt_and_args) == 0
    or die "Can't create PDF file from $input_html_file to $output_pdf_file: $wkhtmltopdf_cmd_with_opt_and_args";
}

sub concat_pdf_file {
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
  
  # 各章を結合
  for my $chapter_number (1 .. $chapter_number_last) {
    my $chapter_html_file_base = sprintf("chapter%02d.pdf", $chapter_number);
    
    my $chapter_pdf = PDF::API2->open("$FindBin::Bin/public/$chapter_html_file_base");
    for my $page_number (1 .. $chapter_pdf->pages) {
      $all_pdf->import_page($chapter_pdf, $page_number);
    }
    if ($all_pdf->pages % 2 != 0) {
      $all_pdf->page;
    }
  }
  
  # ページ番号を挿入(はじめにから)
  for (my $page_number = 3; $page_number <= $all_pdf->pages; $page_number++) {
    my $font = $all_pdf->corefont('Helvetica');
    my $page = $all_pdf->openpage($page_number);
    my $text_page_number = $page->text();
    $text_page_number->font($font, 8.5);
    
    # 表示ページ番号
    my $display_page_number = $page_number - 2;

    # 右開き奇数
    if ($display_page_number % 2 != 0) {
      $text_page_number->translate(400, 12);
    }
    # 左開き偶数
    else {
      $text_page_number->translate(15, 12);
    }
    $text_page_number->text($display_page_number);
  }

  # 全体を出力
  my $all_pdf_file = "$FindBin::Bin/public/book.pdf";
  $all_pdf->saveas($all_pdf_file);
}

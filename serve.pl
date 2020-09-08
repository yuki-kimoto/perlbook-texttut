use strict;
use warnings;
use utf8;

use Giblog;
use Mojolicious::Lite;

# Build
Giblog->build;

# Mojolicious::Lite Application
my $app = app;

system('/usr/local/bin/wkhtmltopdf --lowquality --page-size A5 --margin-bottom 10mm --margin-left 10mm --margin-right 10mm --margin-top 10mm public/beginning.html public/beginning.pdf') == 0
  or die;

system('/usr/local/bin/wkhtmltopdf --lowquality --page-size A5 --margin-bottom 10mm --margin-left 10mm --margin-right 10mm --margin-top 10mm public/toc.html public/toc.pdf') == 0
  or die;

system('/usr/local/bin/wkhtmltopdf --lowquality --page-size A5 --margin-bottom 10mm --margin-left 10mm --margin-right 10mm --margin-top 10mm public/chapter1.html public/chapter1.pdf') == 0
  or die;

# system('/usr/local/bin/wkhtmltopdf --lowquality --page-size A5 --margin-bottom 0mm --margin-left 0mm --margin-right 0mm --margin-top 0mm public/index.html public/output.pdf') == 0
#  or die;

# Serve
Giblog->serve($app);

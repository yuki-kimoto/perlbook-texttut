use strict;
use warnings;
use utf8;

use Giblog;
use Mojolicious::Lite;

# Build
Giblog->build;

# Mojolicious::Lite Application
my $app = app;

system('/usr/local/bin/wkhtmltopdf --lowquality --page-size A5 --margin-bottom 5mm --margin-left 10mm --margin-right 10mm --margin-top 5mm public/index.html public/output.pdf') == 0
  or die;

# Serve
Giblog->serve($app);

use Test::More qw(no_plan);
use Config;

my $SH2PERL = "blib/script/sh2perl";

my $output = `echo echo 1=\\\$1 2=\\\$2 | $SH2PERL | $Config{'perlpath'} - a b`;
is($output, "1=a 2=b\n", "command-line args can be passed");

use Test::More qw(no_plan);
use Config;

my $SH2PERL = "blib/script/sh2perl";

is(scalar `echo echo hello world | $SH2PERL | $Config{'perlpath'}`,
   "hello world\n",
   "basic output");

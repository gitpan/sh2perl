BEGIN { $| = 1; print "1..3\n"; }
END {print "ok 3\n"; }

use Config;

my $SH2PERL = "blib/script/sh2perl";

print "ok 1\n";
my $output = `echo echo 1=\\\$1 2=\\\$2 | $SH2PERL | $Config{'perl'} - a b`;
print "# $output";
print "not " unless
  "1=a 2=b\n" eq $output;

print "ok 2\n";

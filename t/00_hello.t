BEGIN { $| = 1; print "1..3\n"; }
END {print "ok 3\n"; }

use Config;

my $SH2PERL = "blib/script/sh2perl";

print "ok 1\n";
print "not " unless
  "hello world\n" eq `echo echo hello world | $SH2PERL | $Config{'perl'}`;
print "ok 2\n";

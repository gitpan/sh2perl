use Test::Harness qw(runtests);
use Config;

runtests <tests/*.t> or exit 1;

## send mail for success
my ($sendmail) = grep -e,
  qw(/usr/lib/sendmail /usr/sbin/sendmail /usr/ucblib/sendmail);

## blah... these should be in %ENV
open MAKEFILE, "Makefile";
my %makehash = map /^(\w+)\s*=\s*(.*)/, <MAKEFILE>;
close MAKEFILE;

open SENDMAIL, "|$sendmail -t" or exit 0;
print SENDMAIL
  "To: sh2perl-success\@stonehenge.com\n",
  "Subject: success for $makehash{DISTNAME}-$makehash{VERSION}\n\n",
  Config::myconfig();
close SENDMAIL;

use Config;
use File::Basename qw(basename dirname);

$VERSION = '0.03';

chdir(dirname($0));
($file = basename($0)) =~ s/\.PL$//;
$file =~ s/\.pl$//
	if ($Config{'osname'} eq 'VMS' or
	    $Config{'osname'} eq 'OS2');  # "case-forgiving"
open OUT,">$file" or die "Can't create $file: $!";
chmod(0755, $file);
print "Extracting $file (with variable substitutions)\n";

print OUT <<"!GROK!THIS!";
$Config{'startperl'}

## version $VERSION

print <<'HEAD', <>, <<'FOOT';
$Config{'startperl'}
exec '$Config{'sh'}', '-c', <<'StuffyFunk', \$0, \@ARGV;
HEAD
StuffyFunk
FOOT
!GROK!THIS!

print OUT <<'!NO!SUBS!';

=head1 NAME

sh2perl - convert Bourne shell script to Perl program

=head1 SYNOPSIS

 sh2perl shell-script >perl-program
 sh2perl <shell-script | perl - shellarg1 shellarg2 shellarg3 ...

=head1 DESCRIPTION

sh2perl takes a shell script specified on the command line (or
from standard input) and produces a comparable Perl script 
on the standard output.

The program should operate identically within the scope of the
possible emulation, and at speeds comparable, if not faster,
than the original shell script.

=head1 SEE ALSO

L<a2p>, L<s2p>, L<perl>

=head1 AUTHOR

Randal L. Schwartz, C<merlyn@stonehenge.com>,
C<http://www.stonehenge.com/merlyn/>.

=head1 BUGS

If your shell script contains a single line consisting of:

  StuffyFunk

all following text will be ignored.  Future versions of I<sh2perl>
may eliminate this bug.

Handles the One True Shell (C</bin/sh>) only.  Other shells will
probably not be supported.  (Use the I<csh2sh> tool first on
C-shell scripts.)

=head1 Y2K COMPLIANCE

This distribution has no known Y2K problems.

=head1 PERL TRAINING

Learn Perl now!  Visit our website at
C<http://www.stonehenge.com/perltraining/>!

=cut
!NO!SUBS!

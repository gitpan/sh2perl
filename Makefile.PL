use 5.006;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	      NAME => 'sh2perl',
	      VERSION_FROM => 'script/sh2perl.PL',
	      PL_FILES =>
	      {
	       'script/sh2perl.PL' => 'script/sh2perl',
	      },
	      EXE_FILES => ['script/sh2perl'],
	      PREREQ_PM =>
	      {
	       'Test::More' => 0,
	      },
	      ($] >= 5.005 ?
	       (ABSTRACT_FROM => 'script/sh2perl.PL',
		AUTHOR => 'Randal L. Schwartz <merlyn@stonehenge.com>') : ()),
);

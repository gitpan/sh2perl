use ExtUtils::MakeMaker;

WriteMakefile(
	      'NAME' => 'sh2perl',
	      'VERSION_FROM' => 'bin/sh2perl.PL',
	      'PL_FILES' => { "bin/sh2perl.PL" => "bin/sh2perl" },
	      'EXE_FILES' => [ "bin/sh2perl" ],
	      'dist' => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);

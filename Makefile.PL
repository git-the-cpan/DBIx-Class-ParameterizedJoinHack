use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

(do 'maint/Makefile.PL.include' or die $@) unless -f 'META.yml';

my $eumm_version  = eval $ExtUtils::MakeMaker::VERSION;

my %_test_req = (
    'Test::More' => 0,
    'Test::Fatal' => 0,
);
my %_build_req = (
    ($eumm_version < 6.63_03) ? (%_test_req) : (),
);
my %_req = (
    ($eumm_version < 6.55_01) ? (%_build_req) : (),
    'DBIx::Class' => 0,
);

WriteMakefile(
  NAME => 'DBIx::Class::ParameterizedJoinHack',
  VERSION_FROM => 'lib/DBIx/Class/ParameterizedJoinHack.pm',
  LICENSE => 'perl5',
  TEST_REQUIRES => \%_test_req,
  BUILD_REQUIRES => \%_build_req,
  PREREQ_PM => \%_req,
);

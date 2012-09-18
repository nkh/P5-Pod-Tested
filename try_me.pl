use strict ;
use warnings ;

use blib ;
use Data::TreeDumper ;
use POD::Tested ; 
use IO::String ;
use File::Slurp ;

my $parser = POD::Tested->new(STRING => <<'EOT', INPUT => 'from a test', LINE => 'not set') ;
=head1 HEAD1

some text

  for my $v (qw(1 ))
	{
	
	is($v, 1) ;
	
	}

  generate_pod("  #test\n") ;

=cut
EOT


my $test = Test::More->builder ;
my $number_of_failed_tests = grep {$_->{ok} != 1} $test->details() ;

if($number_of_failed_tests)
	{
	warn "POD::Tested: No output is generated if a test fails!\n" ;
	}
else
	{
	warn "Generating  POD tested output.\n" ;
	#~ write_file($output, $parser->GetPOD()) ;
	print $parser->GetPOD() ;
	}


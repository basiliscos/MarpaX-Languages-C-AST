#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 4;

BEGIN {
    use_ok( 'MarpaX::Languages::C::AST::Grammar::ISO_ANSI_C_2011' ) || print "Bail out!\n";
}

my $grammar  = MarpaX::Languages::C::AST::Grammar::ISO_ANSI_C_2011->new();

my $isoAnsiC2011 = $grammar->content();
ok(defined($isoAnsiC2011));
my $grammar_option = $grammar->grammar_option();
ok(ref($grammar_option) eq 'HASH');
my $recce_option = $grammar->recce_option();
ok(ref($recce_option) eq 'HASH');
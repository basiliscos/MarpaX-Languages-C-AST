#!perl -T
use strict;
use warnings FATAL => 'all';
use Test::More tests => 2;

BEGIN {
    push(@INC, 'inc');
    use_ok( 'MarpaX::Languages::C::AST' ) || print "Bail out!\n";
}
use MarpaX::Languages::C::AST::Expected;

my $cSourceCode = do { local $/; <DATA> };
my $cAst = MarpaX::Languages::C::AST->new();
my $valuep = $cAst->parse(\$cSourceCode)->value();
ok(defined($valuep), 'Output from parse()->value() is ok');

__DATA__
typedef struct my_struct_ {
    int this;
    int func(int i);
} s_mystruct_;

void func() {
    goto this;
  this:
    return;
}


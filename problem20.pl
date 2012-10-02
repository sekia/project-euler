#!/usr/bin/perl

use 5.014;
use List::Util qw/sum reduce/;
use Math::BigInt try => 'GMP';

sub factorial {
  my $n = shift;
  return 1 if $n == 0;
  reduce { Math::BigInt->new($a) * Math::BigInt->new($b) } 1 .. $n;
}

say sum split //, factorial(Math::BigInt->new(100));

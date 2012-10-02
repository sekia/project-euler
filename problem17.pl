#!/usr/bin/perl

use 5.012;
use Lingua::EN::Numbers qw/num2en/;
use List::Util qw/sum/;

sub num_of_chars_in_english(_) {
  my $english_expr = num2en shift;
  $english_expr =~ tr/a-z//;
}

say sum map { num_of_chars_in_english } 1 .. 1000;

#!/usr/bin/perl
use feature qw(say);
use warnings;
use strict;
use Term::ANSIColor;

$| = 1;   # for multiple colorizing.
if (@ARGV <= 0) {
  exit 1;
}

my $pattern = shift @ARGV or exit "replaced required\n";
my $color = shift @ARGV or exit "color required\n";

my @colors = split(/\b/, $color);
exit if (@colors <= 0);

sub colorize ($@) {
  my $pattern = shift;
  my @colors = @_;

  my $color_code = color(@colors);
  my $color_reset = color("reset");
  while (<STDIN>) {
    s/$pattern/${color_code}$&${color_reset}/gi;
  } continue {
    print $_;
  }
}

colorize($pattern, @colors);

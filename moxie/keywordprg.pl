#!/usr/bin/env perl
use v5.10;
use strict;
use warnings;
use Data::Dumper;
binmode STDOUT, ":encoding(UTF-8)";
binmode STDIN, ":encoding(UTF-8)";
use utf8;
use open      qw(:std :utf8);    # undeclared streams in UTF-8
open my $f, '<:encoding(UTF-8)', 'moxie_instructions.txt';
while (<$f>) {
  if (/^$ARGV[0]\t/) {
    say;
    exit;
  }
}
seek $f, 0, 0;
my $i = 0;
while (<$f>) {
  if (/$ARGV[0]/) {
    say;
    last if $i++ >= 10;
  }
}

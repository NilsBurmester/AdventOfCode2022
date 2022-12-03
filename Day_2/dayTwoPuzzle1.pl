#!/usr/bin/perl
use warnings;
use strict;
use Cwd;

my $dir = getcwd;
require "$dir/getFile.pl";

my @strat = getFile("inputDay2.txt");
my $score = 0; 
my %outcomes = ("A X" => 3, "A Y" => 6, "A Z" => 0,
                "B X" => 0, "B Y" => 3, "B Z" => 6,
                "C X" => 6, "C Y" => 0, "C Z" => 3);

my %shapes = ("X" => 1, "Y" => 2, "Z" => 3);

foreach (@strat) {
    chomp $_;
    $score += $outcomes{$_};
    
    my $substring = substr($_, 2);
    
    $score += $shapes{$substring};
}

print $score;

#!/usr/bin/perl
use warnings;
use strict;
use Cwd;
use v5.10;

my $dir = getcwd;
require "$dir/getFile.pl";

my @strat = getFile("inputDay2.txt");
my $score = 0; 
my %outcomes = ("A X" => 0, "A Y" => 3, "A Z" => 6,
                "B X" => 0, "B Y" => 3, "B Z" => 6,
                "C X" => 0, "C Y" => 3, "C Z" => 6);

my %shapes = ("X" => 1, "Y" => 2, "Z" => 3);

foreach (@strat) {
    chomp $_;
    $score += $outcomes{$_};
    
    my $result = substr($_, 2);
    my $move = substr($_, 0, 1);
      if ($result eq "X") {
        given($move) {
            when ("A") { $score += $shapes{"Z"} }
            when ("B") { $score += $shapes{"X"} }
            when ("C") { $score += $shapes{"Y"} }
        }
    }
    elsif ($result eq "Y") {
        given($move) {
            when ("A") { $score += $shapes{"X"} }
            when ("B") { $score += $shapes{"Y"} }
            when ("C") { $score += $shapes{"Z"} }
        }
    }
    elsif ($result eq "Z") {
        given($move) {
            when ("A") { $score += $shapes{"Y"} }
            when ("B") { $score += $shapes{"Z"} }
            when ("C") { $score += $shapes{"X"} }
        }
    }
}
print $score;

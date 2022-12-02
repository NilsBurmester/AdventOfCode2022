#!/usr/bin/perl
use strict; 
use warnings; 
use Cwd;

my $dir = getcwd;
my $highestCal = 0;
my $secondHighestCal = 0; 
my $thirdHighestCal = 0;
my $currentCal = 0; 

require "$dir/getFile.pl";

my @x = getFile("inputDay1.txt");

foreach (@x) {
    chomp $_;

    if ($_ ne "") {
        $currentCal = $currentCal + $_;
    }

    if ($_ eq "") {
        if ($currentCal > $highestCal) {
            $thirdHighestCal = $secondHighestCal;
            $secondHighestCal = $highestCal;
            $highestCal = $currentCal;
        }
        if ($currentCal > $secondHighestCal && $currentCal < $highestCal) {
           $thirdHighestCal = $secondHighestCal;
            $secondHighestCal = $currentCal; 
        }
        if ($currentCal > $thirdHighestCal && $currentCal < $secondHighestCal) {
            $thirdHighestCal = $currentCal;
        }
       
        $currentCal = 0;

    }
}
my $solution = $highestCal + $secondHighestCal + $thirdHighestCal;

 print $solution;



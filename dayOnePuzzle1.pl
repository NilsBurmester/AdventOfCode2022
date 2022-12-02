#!/usr/bin/perl
use strict; 
use warnings; 
use Cwd;

my $dir = getcwd;
my $highestElve = 1; 
my $highestCal = 0;
my $currentElve = 0;
my $currentCal = 0; 

require "$dir/getFile.pl";

my @x = getFile("Inputs/inputDay1.txt");

foreach (@x) {
    
    $currentElve += 1;
    chomp $_;

    if ($_ ne "") {
        $currentCal = $currentCal + $_;
    }

    if ($_ eq "") {
        if ($currentCal > $highestCal) {
            $highestCal = $currentCal;
            $highestElve = $currentElve;
        }
       
        $currentCal = 0;

    }
}

 print "$highestCal\t $highestElve\n";



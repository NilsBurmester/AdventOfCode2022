#!/usr/bin/perl
use warnings;
use strict;
use Cwd;

my $dir = getcwd;
require "$dir/getfile.pl";

my @contents = getFile("inputDay4.txt");

my $corrections = 0; 

foreach (@contents) {
    chomp $_;
    my @ranges = $_ =~ /(\d+)/g;
    
    foreach (@ranges) {
        $_ = int($_);
    }

    my @range1 = ($ranges[0] .. $ranges[1]);
    my @range2 = ($ranges[2] .. $ranges[3]);
    my $size1 = scalar(@range1);
    my $size2 = scalar(@range2);
    my $check = 1; 

    if ($size1 <= $size2) {
        foreach (@range1) {
            if (!($_ ~~ @range2)) {$check = 0; last;}
        }
    }
    if ($size2 <= $size1) { 
        foreach (@range2) {
            if (!($_ ~~ @range1)) {$check = 0; last;}
        } 
    }
    if ($check == 1) {$corrections += 1}
}

print $corrections;
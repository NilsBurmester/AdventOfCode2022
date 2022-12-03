#!/usr/bin/perl
use warnings;
use strict;
use Cwd;


my $dir = getcwd;
require "$dir/getfile.pl";

my @contents = getFile("inputDay3.txt");
my %priorities =    ("a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7, "h" => 8, "i" => 9, "j" => 10, "k" => 11, "l" => 12, "m" => 13, "n" => 14, "o" => 15,
                     "p" => 16, "q" => 17, "r" => 18, "s" => 19, "t" => 20, "u" => 21, "v" => 22, "w" => 23, "x" => 24, "y" => 25, "z" => 26, 
                     "A" => 27, "B" => 28, "C" => 29, "D" => 30, "E" => 31, "F" => 32, "G" => 33, "H" => 34, "I" => 35, "J" => 36, "K" => 37,
                     "L" => 38, "M" => 39, "N" => 40, "O" => 41, "P" => 42, "Q" => 43, "R" => 44, "S" => 45, "T" => 46, "U" => 47, "V" => 48,
                     "W" => 49, "X" => 50, "Y" => 51, "Z" => 52, "no common" => 0); 
my $priority = 0;

foreach (@contents) {
        chomp $_;
        my $length = length($_);
        my $firstCompartment = substr($_, 0, $length/2);
        my $secondCompartment = substr($_, $length/2, $length/2);
        my $common = common($firstCompartment, $secondCompartment);

        $priority += $priorities{$common};
        print "$firstCompartment\t";
        print "$priorities{$common}\t";
        print "$secondCompartment\n";
}
print $priority;

sub common {
   (my $firstHalf, my $secondHalf) = @_; 
    my $length1 = length($firstHalf) - 1;
    my $length2 = length($secondHalf) - 1;
    my $char1 = "";
    my $char2 = "";

    for my $i (0 .. $length1) {
        $char1 = substr($firstHalf, $i, 1);

        for my $j (0 .. $length2) {
            $char2 = substr($secondHalf, $j, 1);

            if ($char1 eq $char2) {return $char2;}
        }
    }
    return "no common";
}

FGfFDBhGGlfGGf
WJWdbSRSnRNbTvdn
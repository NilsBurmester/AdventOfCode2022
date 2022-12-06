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
                     "W" => 49, "X" => 50, "Y" => 51, "Z" => 52); 
my $prioritySum = 0;

for my $i (0 .. scalar(@contents) - 1) {
    if ($i <= (scalar(@contents - 1)) - 2) {
        chomp $contents[$i];
        chomp $contents[$i + 1];
        chomp $contents[$i + 2];
        if ($i % 3 == 0) {
            my $badge = common($contents[$i], $contents[$i + 1], $contents[$i + 2]);
            $prioritySum += $priorities{$badge};
        }    
    }

}

print $prioritySum;


sub common {
   (my $firstRucksack, my $secondRucksack, my $thirdRucksack) = @_; 
    my $char1 = "";
    my $char2 = "";
    my $char3 = "";

    for my $i (0 .. length($firstRucksack) - 1) {
        $char1 = substr($firstRucksack, $i, 1);

        for my $j (0 .. length($secondRucksack) - 1) {
            $char2 = substr($secondRucksack, $j, 1);

            for my $x (0 .. length($thirdRucksack) - 1) {
            $char3 = substr($thirdRucksack, $x, 1);

            if ($char3 eq $char2 && $char2 eq $char1) {return $char3;}
            }
        }
    }
}

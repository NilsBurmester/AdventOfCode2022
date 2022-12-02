#!/usr/bin/perl
use warnings;
use strict;

sub getFile {
    ($a) = @_;
    my @input = (); 
    my $fileName = "Inputs/$a";

    open(my $FH, '<', $fileName) or die "cant open file";

    while(my $line = <$FH>) {
        push @input, $line;
    }
    return @input;
}
1;






#!/usr/bin/env perl
use strict;
use warnings;

# slurp the slides in $content
my $fh;
open $fh, '<', $ARGV[0] or die $!;
my $content = do { local $/; <$fh> };
close $fh;

# split them
my @slides = split('===', $content);

# explode them in views/
my $slide = 0;
for my $s (@slides) {
    my $number = sprintf('%03d', $slide);
    my $this_slide = "../views/slide-$number.tt";
    open my $f, '>', $this_slide or die $!;
    print $f $s;
    close $f;
    
    print "- $this_slide\n";
    $slide++;

}

print "$slide slides built\n";

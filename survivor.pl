# Take a second to imagine that you are in a room with 100 chairs arranged in a circle.
# These chairs are numbered sequentially from one to one onehundred.
# At some point in time, the person in chair #1 will be told to leave the room.
# The person in chair #2 will be skipped, and the person in chair #3 will be told to leave.
# Next to go is person in chair #6. In other words, 1 person will be skipped initially, and then 2, 3, 4, 5, 6, .. and so on.
# This pattern of skipping will keep going around the circle until there is only one person remaining.. the survivor.
# Note that the chair is removed when the person leaves the room.
# If Kanye West were to choose a chair, such that he never got asked to leave, which chair would he choose?

#! /usr/local/bin/perl
use strict;
use warnings;
use Data::Dumper;

print "### SURVIVOR ###\n";

my @array;

for(my $i = 1; $i <= 100000; $i++){
	push @array, $i;
}

my $position = 0;
my $skip = 0;
#print scalar @array;
while( scalar@array > 1 ){
	splice( @array, $position, 1 );
	$skip++;
	$position = $position + $skip;

	#position gets bigger than array
	if( $position >= scalar@array ){
		$position = $position % scalar@array;
	}
}
print "@array\n";


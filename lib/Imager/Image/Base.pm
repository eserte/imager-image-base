# -*- perl -*-

# Copyright (C) 2015 Slaven Rezic. All rights reserved.
# This package is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package Imager::Image::Base;

use strict;
use vars qw($VERSION);
$VERSION = '0.01';

use Imager ();

sub convert {
    my(undef, $image_base) = @_;
    my($w, $h) = $image_base->get('-width', '-height');
    my $imager = Imager->new(xsize => $w, ysize => $h);
    for my $x (0 .. $w-1) {
	for my $y (0 .. $h-1) {
	    my $color = $image_base->xy($x, $y);
	    $imager->setpixel(x => $x, y => $y, color => $color);
	}
    }
    $imager;
}

1;

__END__

=head1 NAME

Imager::Image::Base - convert Image::Base to Imager

=head1 SYNOPSIS

   $image_base_object = Image::Xpm->new(-file => ...);
   $imager_object = Imager::Image::Base->convert($image_base_object);

=head1 DESCRIPTION

Convert an L<Image::Base> object into a L<Imager> object.

=head1 AUTHOR

Slaven Rezic

=head1 SEE ALSO

L<Image::Base>, L<Imager>, L<Imager::Image::Xpm>, L<Imager::Image::Xbm>.

=cut

# -*- perl -*-

# Copyright (C) 2015 Slaven Rezic. All rights reserved.
# This package is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package Imager::Image::Xpm;

use strict;
use vars qw($VERSION);
$VERSION = '0.01';

use Image::Xpm;
use Imager::Image::Base;

sub new {
    my($class, %opts) = @_;
    my $file = delete $opts{file};
    die 'file option is mandatory' if !defined $file;
    die 'Unhandled options: ' . join(' ', %opts) if %opts;
    my $xpm = Image::Xpm->new(-file => $file);
    Imager::Image::Base->convert($xpm);
}

1;

__END__

=head1 NAME

Imager::Image::Xpm - load XPM files into Imager objects

=head1 SYNOPSIS

   $imager_object = Imager::Image::Xpm->new(file => $xpm_filename);

=head1 DESCRIPTION

Load a XPM file into an L<Imager> object using L<Image::Xpm>.

=head2 EXAMPLE

Convert an XPM file to a PNG file:

   use Imager::Image::Xpm;
   Imager::Image::Xpm->new(file => $xpm_file)->write(file => $png_file, type => 'png');

=head1 AUTHOR

Slaven Rezic

=head1 SEE ALSO

L<Image::Xpm>, L<Imager>, L<Imager::Image::Base>.

=cut

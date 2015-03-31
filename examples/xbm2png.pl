#!/usr/bin/perl -w
# -*- perl -*-

# Copyright (C) 2015 Slaven Rezic. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

use strict;
use Imager::Image::Xbm;

my $in  = shift or die "xbm file?";
my $out = shift or die "out file?";
-e $out or die "$out must not exist";

Imager::Image::Xbm->new(file => $in)->write(file => $out, type => 'png');

__END__

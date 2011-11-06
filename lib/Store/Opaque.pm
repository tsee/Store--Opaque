package Store::Opaque;

use 5.008001;
use strict;
use warnings;

use XS::Object::Magic;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Store::Opaque', $VERSION);

sub new {
  my $class = shift;
  my $self = bless {}, $class;
  $self->make_opaque_storage;
  return $self;
}

1;
__END__

=head1 NAME

Store::Opaque - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Store::Opaque;
  blah blah blah

=head1 DESCRIPTION

=head1 SEE ALSO

=head1 AUTHOR

Steffen Mueller, E<lt>smueller@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Steffen Mueller

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.1 or,
at your option, any later version of Perl 5 you may have available.

=cut

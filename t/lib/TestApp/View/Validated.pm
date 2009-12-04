package Catalyst::View::Validated;

use Moose;
use ValidatorOfLies;
use namespace::autoclean;

extends qw/Catalyst::View::TT/;
with qw/Catalyst::TraitFor::View::MarkupValidation/;

has '+_validator_class' => ( default => 'ValidatorOfLies' );

__PACKAGE__->meta->make_immutable;

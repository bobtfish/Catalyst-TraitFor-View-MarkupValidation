package ValidatorOfLies::Error;
use strict;

sub line { $_[0]->[0] }
sub col { $_[0]->[1] }
sub msg { $_[0]->[2] }

package ValidatorOfLies;
use strict;

sub new { bless {}, shift }

our $is_valid = 0;
sub is_valid { $is_valid }

our @errors = (
    [13, 27, 'error foobar'],
);
sub errors {
    [ map { bless $_, 'ValidatorOfLies::Error' } @errors ];
}

1;

__END__

# Tests are then like this:
{
    local $ValidatorOfLies::is_valid = 1;
    local @ValidatorOfLies::errors = (
        [12, 58, 'msg1'],
        [93, 17, 'msg2'],
    );
    my $res = request('/');
    ok !$res->is_success;
    like $res->content, qr/msg1/, 'Got msg1 validation error';
}


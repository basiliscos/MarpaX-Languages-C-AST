use strict;
use warnings FATAL => 'all';

package MarpaX::Languages::C::AST::Callback::Method;
use MarpaX::Languages::C::AST::Callback::Option;
use Class::Struct
    description        => '$',
    extra_description  => '$',
    method             => '@',        # [ CODE ref, CODE ref arguments ]
    method_void        => '$',        # Prevent push to topic data
    method_mode        => '$',        # 'push' or 'replace'
    option             => 'MarpaX::Languages::C::AST::Callback::Option',
    ;

# ABSTRACT: Code reference for the Simple callback generic framework.

use Carp qw/croak/;

# VERSION

=head1 DESCRIPTION

This module is describing the code reference for the Simple Callback framework. The new method supports these items:

=over

=item description

Any string that describes this event. This string is usually the event itself for convenience with the qw/auto/ condition.

=item extra_description

Any string that describes this event even more. Used only for logging in case the description is set to the event name for convenience with the qw/auto/ condition.

=item method

A reference to an array containing a CODE reference in the first indice, then the arguments. Or the single string 'auto'. In case of a CODE reference, The method will be called as $self->$CODE(@arguments) where $self is a reference to the method object. The arguments to the exec() routine will follow @arguments. Or the user can use $self->SUPER::arguments. In case of the single string 'auto', the description attribute will be used, and if there is a topic associated with the description, the derefenced array content of the topic will be pushed. The output of the method attribute will be pushed to any eventual topic associated to the method, unless the method is marked 'void', see below.

=item method_mode

Default is to push any eventual topic data the output of the method. This flag can have values 'push' (default) or 'replace'. When value is 'replace', topic data is replaced by the method output.

=item method_void

Setting this flag to a true value will disable any use of method output, leaving topic data as is.

=item option

A reference to a MarpaX::Languages::C::AST::Callback::Option object.

=back

=cut

1;

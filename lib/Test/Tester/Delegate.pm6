class Test::Tester::Delegate {

    our $AUTOLOAD;

    sub new
    {
        my $pkg = shift;

        my $obj = shift;
        my $self = bless {}, $pkg;

        return $self;
    }

    sub AUTOLOAD
    {
        my ($sub) = $AUTOLOAD =~ /.*::(.*?)$/;

        return if $sub eq "DESTROY";

        my $obj = $_[0].{Object};

        my $ref = $obj.can($sub);
        shift(@_);
        unshift(@_, $obj);
        goto &$ref;
    }

    1;

}

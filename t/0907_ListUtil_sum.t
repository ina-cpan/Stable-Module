use 5.00503;
use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";
BEGIN { $|=1; print "1..1\n"; my $testno=1; sub ok { print $_[0]?'ok ':'not ok ',$testno++,$_[1]?" - $_[1]\n":"\n" }}
use Stable::Module;

my $sum = 0;
eval {
    $sum = sum(1..10);
};
ok(($sum == 55), qq{$^X @{[__FILE__]}});

__END__

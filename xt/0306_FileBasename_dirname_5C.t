use 5.00503;
use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";
BEGIN { $|=1; print "1..3\n"; my $testno=1; sub ok { print $_[0]?'ok ':'not ok ',$testno++,$_[1]?" - $_[1]\n":"\n" }}
use Stable::Module;

my $dirname = '';

eval {
    $dirname = dirname('/usr/lo�\al/bin/perl.pl');
};

ok(($dirname eq '/usr/lo�\al/bin'), qq{dirname('/usr/lo�\al/bin/perl.pl') $^X @{[__FILE__]}});

eval {
    $dirname = dirname('/usr/lo �\ al/bin/perl.pl');
};

ok(($dirname eq '/usr/lo �\ al/bin'), qq{dirname('/usr/lo �\ al/bin/perl.pl') $^X @{[__FILE__]}});

eval {
    $dirname = dirname('/usr/lo �\ al/bin/p�\rl.pl');
};

ok(($dirname eq '/usr/lo �\ al/bin'), qq{dirname('/usr/lo �\ al/bin/p�\rl.pl') $^X @{[__FILE__]}});

__END__

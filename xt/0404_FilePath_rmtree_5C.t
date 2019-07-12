use 5.00503;
use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";
BEGIN { $|=1; print "1..14\n"; my $testno=1; sub ok { print $_[0]?'ok ':'not ok ',$testno++,$_[1]?" - $_[1]\n":"\n" }}
use Stable::Module;

$SIG{__WARN__} = sub {};
$SIG{__DIE__}  = sub {};

my $rmtree = 0;

mkdir('�\',0777)     if not -d '�\';
mkdir('�\/b',0777)   if not -d '�\/b';
mkdir('�\/b/c',0777) if not -d '�\/b/c';
ok((1 or -d '�\'), qq{SKIP -d '�\' $^X @{[__FILE__]}});
ok((-d '�\/b'  ),  qq{-d '�\/b' $^X @{[__FILE__]}});
ok((-d '�\/b/c'),  qq{-d '�\/b/c' $^X @{[__FILE__]}});

eval {
    $rmtree = rmtree('�\');
};

ok(($rmtree >=  1  ), qq{rmtree('�\') $^X @{[__FILE__]}});
ok((not -e '�\/b/c'), qq{not -e '�\/b/c' $^X @{[__FILE__]}});
ok((not -e '�\/b'  ), qq{not -e '�\/b' $^X @{[__FILE__]}});
ok((not -e '�\'    ), qq{not -e '�\' $^X @{[__FILE__]}});

mkdir('�\ �\',0777)         if not -d '�\ �\';
mkdir('�\ �\/b b',0777)     if not -d '�\ �\/b b';
mkdir('�\ �\/b b/c c',0777) if not -d '�\ �\/b b/c c';
ok((1 or -d '�\ �\'   ), qq{SKIP -d '�\ �\' $^X @{[__FILE__]}});
ok((-d '�\ �\/b b'    ), qq{-d '�\ �\/b b' $^X @{[__FILE__]}});
ok((-d '�\ �\/b b/c c'), qq{-d '�\ �\/b b/c c' $^X @{[__FILE__]}});

eval {
    $rmtree = rmtree('�\ �\');
};

ok(($rmtree >= 1          ), qq{rmtree('�\ �\') $^X @{[__FILE__]}});
ok((not -e '�\ �\/b b/c c'), qq{not -e '�\ �\/b b/c c' $^X @{[__FILE__]}});
ok((not -e '�\ �\/b b'    ), qq{not -e '�\ �\/b b' $^X @{[__FILE__]}});
ok((not -e '�\ �\'        ), qq{not -e '�\ �\' $^X @{[__FILE__]}});

__END__

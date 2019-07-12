use 5.00503;
use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";
BEGIN { $|=1; print "1..14\n"; my $testno=1; sub ok { print $_[0]?'ok ':'not ok ',$testno++,$_[1]?" - $_[1]\n":"\n" }}
use Stable::Module;

my $mkpath = 0;

rmdir('�\/b/c') if -d '�\/b/c';
rmdir('�\/b')   if -d '�\/b';
rmdir('�\')     if -d '�\';
ok((not -d '�\'   ),  qq{not -d '�\�[�X' $^X @{[__FILE__]}});
ok((not -d '�\/b'  ), qq{not -d '�\�[�X/b' $^X @{[__FILE__]}});
ok((not -d '�\/b/c'), qq{not -d '�\�[�X/b/c' $^X @{[__FILE__]}});

eval {
    $mkpath = mkpath('�\/b/c');
};

ok(($mkpath >= 1),  qq{mkpath('�\/b/c') $^X @{[__FILE__]}});
ok((1 or -d '�\'),  qq{SKIP -d '�\' $^X @{[__FILE__]}});
ok((-d '�\/b'    ), qq{-d '�\/b' $^X @{[__FILE__]}});
ok((-d '�\/b/c'  ), qq{-d '�\/b/c' $^X @{[__FILE__]}});

rmdir('�\ �\/b b/c c') if -d '�\ �\/b b/c c';
rmdir('�\ �\/b b')     if -d '�\ �\/b b';
rmdir('�\ �\')         if -d '�\ �\';
ok((not -d '�\ �\'        ), qq{not -d '�\ �\' $^X @{[__FILE__]}});
ok((not -d '�\ �\/b b'    ), qq{not -d '�\ �\/b b' $^X @{[__FILE__]}});
ok((not -d '�\ �\/b b/c c'), qq{not -d '�\ �\/b b/c c' $^X @{[__FILE__]}});

eval {
    $mkpath = mkpath('�\ �\/b b/c c');
};

ok(($mkpath >= 1),       qq{mkpath('�\ �\/b b/c c') $^X @{[__FILE__]}});
ok((1 or -d '�\ �\'  ),  qq{SKIP -d '�\ �\' $^X @{[__FILE__]}});
ok((-d '�\ �\/b b'    ), qq{-d '�\ �\/b b' $^X @{[__FILE__]}});
ok((-d '�\ �\/b b/c c'), qq{-d '�\ �\/b b/c c' $^X @{[__FILE__]}});

__END__

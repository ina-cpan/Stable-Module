use 5.00503;
use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";
BEGIN { $|=1; print "1..10\n"; my $testno=1; sub ok { print $_[0]?'ok ':'not ok ',$testno++,$_[1]?" - $_[1]\n":"\n" }}
use Stable::Module;

my $move = 0;

open(FILE,'>�\�[�X1.txt');
print FILE "\n";
close(FILE);

ok((    -e '�\�[�X1.txt'), qq{    -e '�\�[�X1.txt' $^X @{[__FILE__]}});
ok((not -e '�\�[�X2.txt'), qq{not -e '�\�[�X2.txt' $^X @{[__FILE__]}});

eval {
    $move = move('�\�[�X1.txt','�\�[�X2.txt');
};

ok($move, qq{move('�\�[�X1.txt','�\�[�X2.txt') $^X @{[__FILE__]}});
ok((not -e '�\�[�X1.txt'), qq{not -e '�\�[�X1.txt' $^X @{[__FILE__]}});
ok((    -e '�\�[�X2.txt'), qq{    -e '�\�[�X2.txt' $^X @{[__FILE__]}});

unlink('�\�[�X1.txt');
unlink('�\�[�X2.txt');

open(FILE,'>�\ �[ �X1.txt');
print FILE "\n";
close(FILE);

ok((    -e '�\ �[ �X1.txt'), qq{    -e '�\ �[ �X1.txt' $^X @{[__FILE__]}});
ok((not -e '�\ �[ �X2.txt'), qq{not -e '�\ �[ �X2.txt' $^X @{[__FILE__]}});

eval {
    $move = move('�\ �[ �X1.txt','�\ �[ �X2.txt');
};

ok($move, qq{move('�\ �[ �X1.txt','�\ �[ �X2.txt') $^X @{[__FILE__]}});
ok((not -e '�\ �[ �X1.txt'), qq{not -e '�\ �[ �X1.txt' $^X @{[__FILE__]}});
ok((    -e '�\ �[ �X2.txt'), qq{    -e '�\ �[ �X2.txt' $^X @{[__FILE__]}});

unlink('�\ �[ �X1.txt');
unlink('�\ �[ �X2.txt');

__END__

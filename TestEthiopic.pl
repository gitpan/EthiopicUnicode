#!/usr/bin/perl

#  Authored Yekatit 19 1991 (aka February 26 1999)
#  by Daniel Yacob (dmulholl@cs.indiana.edu)
#
#  Use to test Ethiopic character classes after installing
#  the package:
#      ftp://ftp.cs.indiana.edu/pub/fidel/perl-unicode/EthiopicUnicode.tar.gz
#
#  See also:
#      ftp://ftp.cs.indiana.edu/pub/fidel/perl-unicode/EthiopicDemo.tar.gz
#
#  which contains an Ethiopic font for Linux systems.
#
#  ...fix the !oks and win a free dinner anywhere in Addis :-)

use utf8;

$ok    = 0;
$notOk = 0;

$HelloWorld = "ሠላም ዓለም";

print "Hello World ($HelloWorld)\n";
print "  If the parenthesis above appear empty you need to\n";
print "  run the \"ethiopicOn\" script as root.\n\n";

print "We assume now that you have installed the Ethiopic additions\n";
print "in .../lib/perl/5.00XYZ/unicode/ where XYZ is 552 or greater\n\n";

print "Testing Begins....\n\n";

if ($HelloWorld =~ /\p{InEthiopic}/) {
	print "ok 1 $HelloWorld is Ethiopic according to \\p{InEthiopic}\n";
	$ok++;
} else {
	print "!ok 1 $HelloWorld is not Ethiopic according to \\p{InEthiopic}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($HelloWorld =~ /\p{IsSyllable}/) {
	print "ok 2 $HelloWorld is Syllabic according to \\p{IsSyllable}\n";
	$ok++;
} else {
	print "!ok 2 $HelloWorld is not Syllabic according to \\p{IsSyllable}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($HelloWorld =~ /\p{IsAlpha}/ ) {
	print "ok 3 $HelloWorld is Alphabetic according to \\p{IsAlpha}\n";
	$ok++;
} else {
	print "!ok 3 $HelloWorld is not Alphabetic according to \\p{IsAlpha}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($HelloWorld =~ /\p{IsAlnum}/ ) {
	print "ok 4 $HelloWorld is Alpha-numeric according to \\p{IsAlnum}\n";
	$ok++;
} else {
	print "!ok 4 $HelloWorld is not Alpha-numeric according to \\p{IsAlnum}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($HelloWorld =~ /\p{L}/ ) {
	print "ok 5 $HelloWorld is a letter according to \\p{L}\n";
	$ok++;
} else {
	print "!ok 5 $HelloWorld is a letter according to \\p{L}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($HelloWorld =~ /\p{Lo}/ ) {
	print "ok 5 $HelloWorld is an other-letter according to \\p{Lo}\n";
	$ok++;
} else {
	print "!ok 5 $HelloWorld is an other-letter according to \\p{Lo}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($HelloWorld =~ /\x{120b}/) {
	print "ok 6 snagged \"ላ\" with \\x{120b}!\n";
	$ok++;
} else {
	print "!ok 6 didn't snag \"ላ\" with \\x{120b}!\n";
	$notOk++;
}

if ($HelloWorld =~ /\p{Y3}/) {
	print "ok 7 ራብዕ form found using \\p{Y3}!\n";
	$ok++;
} else {
	print "!ok 7  ራብዕ form not found using \\p{Y3}!\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

$lastOk = $ok;
$lastNotOk = $notOk;
print "\nStatus:  $ok-OK  $notOk-Failed\n";
print "Enough Letter testing, lets try numbers...\n\n";

$ENumber = "፯";  # Good 'ol lucky 7...

if ($ENumber =~ /\d/) {
	print "ok 8 $ENumber is a digit according to \\d\n";
	$ok++;
} else {
	print "!ok 8 $ENumber is not a digit according to \\d\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($ENumber =~ /\p{N}/) {
	print "ok 9 $ENumber is a number according to \\p{N}\n";
	$ok++;
} else {
	print "!ok 9 $ENumber is not a number according to \\p{N}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($ENumber =~ /\p{Nd}/) {
	print "ok 10 $ENumber is a digit according to \\p{Nd}\n";
	$ok++;
} else {
	print "!ok 10 $ENumber is not a digit according to \\p{Nd}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($ENumber =~ /\p{IsAlnum}/ ) {
	print "ok 11 $ENumber is Alpha-numeric according to \\p{IsAlpha}\n";
	$ok++;
} else {
	print "!ok 11 $ENumber is not Alpha-numeric according to \\p{IsAlpha}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($ENumber =~ /[፩-፲፻]/) {
    print "ok 12 $ENumber is indeed in the range [፩-፲፻]!\n";
	$ok++;
} else {
    print "!ok 12 $ENumber should be in the range [፩-፲፻]!\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

$ENumber2 = "፸"; # ...and 70 is 10 times as lucky!

if ($ENumber2 =~ /\p{No}/) {
	print "ok 13 $ENumber2 is an other-number according to \\p{No}\n";
	$ok++;
} else {
	print "!ok 13 $ENumber2 is not an other-number according to \\p{No}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

printf "\nStatus:  %i-OK  %i-Failed\n", ($ok-$lastOk), ($notOk-$lastNotOk);
$lastOk = $ok;
$lastNotOk = $notOk;
print "Enough Numeral testing, lets put Ethiopic Wordspace to the test...\n\n";

$ESpace = "፡";

if ($ESpace =~ /\s/) {
	print "ok 14 $ESpace is a space according to \\s\n";
	$ok++;
} else {
	print "!ok 14 $ESpace is not a space according to \\s\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($ESpace =~ /\p{Z}/) {
	print "ok 15 $ESpace is a space according to \\p{Z}\n";
	$ok++;
} else {
	print "!ok 15 $ESpace is not a space according to \\p{Z}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

if ($ESpace =~ /\p{Zs}/) {
	print "ok 16 $ESpace is a space according to \\p{Zs}\n";
	$ok++;
} else {
	print "!ok 16 $ESpace is not a space according to \\p{Zs}\n";
	print "  Did you install the Ethiopic additions in .../lib/perl/5.00XYZ/unicode/ ??\n";
	$notOk++;
}

printf "\nStatus:  %i-OK  %i-Failed\n", ($ok-$lastOk), ($notOk-$lastNotOk);
$lastOk = $ok;
$lastNotOk = $notOk;
print "We're done with spaces, now onto linguistic type stuff...\n\n";

$bet    = "ቤት";  # House
$bete   = "ቤቴ";  # My House
$betoc  = "ቤቶች";  # Houses
$betoce = "ቤቶቼ"; # My Houses

$word = $bete;
if ( $word =~ /\A$bet\p{Y4}\z/ ) {
	print "ok 17 we found $bet in $bete using $bet\\p{Y4}\n";
	$ok++;
} else {
	print "!ok 17 we did not find $bet in $bete using $bet\\p{Y4}\n";
	$notOk++;
}

if ( $word =~ /\A$bet(?<=\p{Y4})\z/ ) {
	print "ok 18 we found $bet in $bete using $bet(?<=\\p{Y4})\n";
	$ok++;
} else {
	print "!ok 18 we did not find $bet in $bete using $bet(?<=\\p{Y4})\n";
	$notOk++;
}

$plural = "\\p{Y6}ች";
$pos1ps = "\\p{Y4}";

if ( $word =~ /($pos1ps)\z/ ) {
    print "ok 19 we found $pos1ps at the end of $word\n";
	$ok++;
} else {
    print "!ok 19 we did not find $pos1ps at the end of $word\n";
	$notOk++;
}

$word = $betoc;
if ( $word =~ /$plural\z/ ) {
    print "ok 20 we found $plural at the end of $word\n";
	$ok++;
} else {
    print "!ok 20 we did not find $plural at the end of $word\n";
	$notOk++;
}

$word = $betoce;
if ( $word =~ /$plural$pos1ps\z/ ) {
    print "ok 21 we found $plural$pos1ps at the end of $word\n";
	$ok++;
} else {
    print "!ok 21 we did not find $plural$pos1ps at the end of $word\n";
	$notOk++;
}

$stem = $bet;
if ( $word =~ /\A($stem)($plural)?($pos1ps)?\z/ ) {
    print "ok 22 we found stem($1) -suffix($2) -suffix($3)\n";
	$ok++;
} else {
    print "!ok 22 we did not find $stem -$plural -$pos1ps in $word\n";
	$notOk++;
}

printf "\nStatus:  %i-OK  %i-Failed\n", ($ok-$lastOk), ($notOk-$lastNotOk);
$total = $ok + $notOk;
printf "Totals:  %i/%i-OK  %i/%i-Failed\n", $ok, $total, $notOk, $total;

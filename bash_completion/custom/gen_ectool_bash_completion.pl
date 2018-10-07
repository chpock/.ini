#!/usr/bin/env ec-perl

use ElectricCommander;
use File::Basename;

my $eccommands;

$eccommands = ($^O eq "MSWin32") ?
    "c:/Program Files/Electric Cloud/ElectricCommander/src/eccommands.pl" :
    "/opt/electriccloud/electriccommander/src/eccommands.pl";

require $eccommands;

my $in;
my $data;
my $out;

local $/ = undef;
open $in, '<:encoding(UTF-8)', dirname($eccommands) . '/ectool.pl';
$data = <$in>;
close $in;

$data =~ /\$version = "([0-9\.]+)";/;
my $ver = $1;

#-------------------------

my @desc = ();
my @args = ();

foreach my $c (sort keys %::gCommands) {

    my $usage = $::gCommands{$c}->{usage};

    my $first = 1;

    my @current_args = ('--help');

    foreach my $line (split(/\n/, $usage)) {
        if ($first) {
            push(@desc, "[$c]='$line'");
            $first = 0;
        } else {
            $line =~ s/^\s+//;
            $line =~ s/^\[//;
            $line =~ s/\]$//;
            push(@current_args, $line);
        }
    }

    push(@args, "[$c]='" . join('~', @current_args) . "'");

}

my $desc_str = "declare -A __ectool_api_desc=( " . join(' ', @desc) . " )";
my $args_str = "declare -A __ectool_api_args=( " . join(' ', @args) . " )";

open $in, '<:encoding(UTF-8)', 'ectool.bash';
$data = <$in>;
close $in;

$data =~ s/declare -A __ectool_api_desc[^\n]+/$desc_str/;
$data =~ s/declare -A __ectool_api_args[^\n]+/$args_str/;
$data =~ s/# api version:[^\n]*/# api version: $ver/;

open $out, '>:encoding(UTF-8)', 'ectool.bash';
binmode($out);
print $out $data;
close $out;


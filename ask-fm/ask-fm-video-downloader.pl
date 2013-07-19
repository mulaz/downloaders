#!/usr/bin/perl


use Data::Dumper;
use LWP::Simple;

$url=$ARGV[0];

$url=~/http:\/\/ask\.fm\/[^\/]+\/answer\/(\d+)/;
$filename=$1;

$html=get($url);

#print $html;

$html=~ /App.rtmp_server = '(rtmp:\/\/[^']+?)';/s;

$rtmpserver=$1;


$html=~/VideoAnswer.flipVideoAnswer\(this, &quot;([^&]+?)&quot;, &quot;Play again/;
$video=$1;


print "rtmpdump -r $rtmpserver/$video > answer-$filename.flv\n";


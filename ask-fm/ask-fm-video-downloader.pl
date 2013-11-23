#!/usr/bin/perl
use Data::Dumper;
use LWP::Simple; 

$url=$ARGV[0];

$url=~/http:\/\/ask\.fm\/[^\/]+\/answer\/(\d+)/;
$filename=$1;

$html=get($url);
#$html=`curl $url`;

#print $html;

$html=~ /App.rtmp_server = '(rtmp:\/\/[^']+?)';/s;

$rtmpserver=$1;


$html=~/VideoAnswer.flipVideoAnswer\(this, &quot;([^&]+?)&quot;, &quot;/;
$video=$1;


print "rtmpdump -r $rtmpserver/$video -o answer-$filename.flv\n";

#`rtmpdump -r $rtmpserver/$video -o answer-$filename.flv`;

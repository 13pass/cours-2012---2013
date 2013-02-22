#!/usr/bin/env perl
use strict;
use warnings;
use Time::HiRes qw( gettimeofday tv_interval  );
use Mojo::UserAgent;
use Data::Dumper;
my $ua = Mojo::UserAgent->new;
my $t0 = [gettimeofday];

for my $url ('mojolicio.us', 'www.cpan.org','www.ingesup.com','www.mongodb.org') {
  print $ua->get($url)->res->dom->html->head->title->text."\n";
}
#sleep(2);
my $elapsed = tv_interval($t0,[gettimeofday]);
printf("la boucle a duré: %.6f seconds\n",$elapsed);



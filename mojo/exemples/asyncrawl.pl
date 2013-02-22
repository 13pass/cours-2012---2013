#!/usr/bin/env perl
use Time::HiRes qw( gettimeofday tv_interval  );
use Mojo::UserAgent;
my $ua = Mojo::UserAgent->new;

# Non-blocking parallel requests (does work inside a running event loop)
my $delay = Mojo::IOLoop->delay();
$delay->on(finish => sub { 
  print "BOOM!\n"; 
});

my $t0 = [gettimeofday];

for my $url ('mojolicio.us', 'www.cpan.org','www.ingesup.com','www.mongodb.org') {
  $delay->begin;
  $ua->get($url => sub {
    my ($ua, $tx) = @_;
    print $tx->res->dom->at('title')->text ."\n";
    $delay->end($tx->res->dom->at('title')->text);
  });
}

my $elapsed = tv_interval($t0,[gettimeofday]);
printf("la boucle a duré: %.6f seconds\n",$elapsed);

$delay->wait unless Mojo::IOLoop->is_running;

$elapsed = tv_interval($t0,[gettimeofday]);
printf("le traitement a duré: %.6f seconds\n",$elapsed);


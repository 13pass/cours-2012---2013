#Historique

Par le créateur de Catalyst framework web de référence de Perl.


#Mojolicious 

un framework web orienté temps réel appelé Mojolicious.

Mais le plus gros du framework repose sur un framework pour développeurs de framework, appelé Mojo. Mojo permet entre autre de manipuler des requêtes HTTP aussi bien en tant que client ou serveur et constitue un middleware, c'est à dire une interface entre un serveur web et un programme Perl.

On peut utiliser 2 configurations du framework:
* une version allégé: Mojolicious::Lite 
Rapide à prendre en main et simple à utiliser, qui ne nécessite qu'un seul fichier. Pratique pour débuter ou pour faire du prototypage rapide.
* une version structurée: Mojolicious
Intégrant une arborescence MVC. Plus adapté pour des grosses applications. 



##Serveur web intégré.

Le framework vient avec 2 serveurs web:
* l'un built-in qui peut être aussi utilisé avec le programme morbo pour le dev qui rechargera le code à chaque fois que celui ci à été modifié.
* Hypnotoad un serveur web, optimisé pour Unix, intégrant un pool de worker qui sont des processus lancés par anticipation pour gérer les entrées/sorties non-bloquantes.

Permet de gérer en natif les protocoles WebSocket, Comet (long polling) ainsi qu'une boucle événementielle gérant les entrées/sorties de façon asynchrone et non-bloquante.

Plus de détails:
http://mojolicio.us/perldoc/Mojo/Server/Prefork
![architecture Mojo](http://diegok.github.com/mojolicious-talk/file/intro/blocks.png)


##Présentation en vidéo
http://www.youtube.com/watch?v=PFItNoecEfA&list=PLE3F888A650339DDF&index=15

##Prérequis

Nécessite Perl 5.10.1+



##Installation:

sudo apt-get install build-essential
sudo cpan App::cpanminus

sudo cpanm Mojolicious

##Hello World

use Mojolicious::Lite;
get '/' => {text => 'Hello World!'};
app->start;

morbo hello.pl

#Perl

##Perl 5 et Perl 6

##CPAN

*Docs au format Perldoc
*Test unitaire pour chaque fonctionnalité

##Modern Perl
http://modernperlbooks.com/books/modern_perl/

```perl
#!/usr/bin/env perl

use 5.010;

#directives de compilateur:
use strict;   #oblige la déclaration des variables. Interdit l'utilisation de mots non-déclarés, etc...
use warnings; #avertit des problèmes de syntaxe
```

##tuto en ligne Perl:
http://perltuts.com/tutorials/quick-start  

http://formation-perl.fr/guide-perl.html
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

## projet de TP : 
Comparateur de trajet temps réel (covoiturage, autolib, train, avion).

Pour simplfier on ne prend qu'un seul moyen de transport pour un trajet

## web crawling

http://mojolicio.us/perldoc/Mojo/UserAgent

### json parsing and json pointers

http://mojolicio.us/perldoc/Mojo/JSON/Pointer

### css selectors

http://www.w3schools.com/cssref/css_selectors.as

## aspects légaux du scraping de données

La récolte des données pose généralement peu de problèmes mais la reproduction du contenu extrait doit être autorisée par les ayants droits sur ce contenu. 

Alors comment savoir si on est autorisé à exploiter le contenu d'un site?

Aujourd'hui il reste un flou entre la theorie et la pratique avec du côté theorique les lois concernant les droits d'auteurs et du côté pratique des milliers de moteurs de recherche, d'aggregateur et de comparateur qui reprennent le contenu de sites et le publient a nouveau souvent sous une forme différente qui peut donner une valeur ajoutée au contenu.

Pour cela on peut toutefois se baser sur plusieurs éléments:

* Les clauses de propriété intellectuelle: 
Elles souvent présentes au niveau des conditions générales d'utilisations d'un site.

* Les licences d'utilisation de contenu:
Celles ci sont de plus en plus claires et simples à utiliser, notamment les licences de type créatives commons http://fr.wikipedia.org/wiki/Licence_Creative_Commons.
Si un contenu est sous licence il suffit de se reporter à cette licence pour connaître quels sont les utilisations possible de ce contenu. 

* Le fichier robots.txt
Utilisé par les moteurs de recherche afin de permettre aux sites de définir quelles pages ils souhaitent autoriser ou exclure du traitement des robots de crawling.  http://en.wikipedia.org/wiki/Robots_exclusion_standard

Finalement dans le doute le mieux reste encore de contacter les responsables du site en question afin de leur demander une autorisation écrite pour exploiter leur contenu en leur expliquant en quoi cela peut leur être bénéfique (redirection de trafic, mise en avant de site, etc...)


## fil rouge du TP: une fois les données récupérées et traitées il faut renvoyer le résultat à l'utilisateur.

L'idée ici étant de renvoyer à l'utilisateur les informations de trajet dès que le serveur a finit de les traiter. 
Pour cela il faut donc que le serveur puisse envoyer des données au navigateur.

Vous pouvez vous inspirer du site http://www.skyscanner.fr pour l'interface
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

Pour cela plusieurs stratégies sont possibles:

* Créer une requête d'interrogation Ajax pour chaque service de transport requêté.
Ok mais si on interroge 10 services, cela signifie que l'on envoi simultanément 10 requêtes HTTP classique ce qui peut s'avérer assez lourd.

* Faire du long polling pour simuler une connection entre le serveur et le client.
Il s'agit de toujours avoir une connection HTTP ouverte afin de permettre au serveur d'envoyer des données au navigateur.
Cela peut être moins lourd que plusieurs requêtes en Ajax mais nécessite toujours plusieurs requêtes HTTP classiques. Et cela implique de deployer un service de type Comet côté serveur.

* Utiliser une communication bidirectionnelle tel que les websocket ou les Sockets Flash.
Ici la communication entre client et serveur est optimisée car il n'y a plus besoin de renvoyer les entêtes HTTP pour chaque message.
Par contre seuls les navigateurs récents implémente les websockets, les Sockets Flash bénéficient d'un taux important de navigateur intégrant un plugin flash sauf sur certains types de mobiles et tablettes.

## Websockets

Les WebSockets utilisent le protocole HTTP pour que les requêtes envoyées soient considérées comme du HTTP classique.

```
//creates a WebSocket and connect to server
var exampleSocket = new WebSocket("ws://www.example.com/socketserver");
```

```
GET /socketserver HTTP/1.1\r\n
host: example.com\r\n
upgrade: websocket\r\n
connection: upgrade\r\n
sec-websocket-version: 13\r\n
sec-websocket-key: E4WSEcseoWr4csPLS2QJHA==\r\n
\r\n
```

le serveur doit répondre avec le code 101 standard indiquant que le serveur comprend la demande de mise à niveau et souhaite changer de protocole

```
HTTP/1.1 101 OK
upgrade: websocket\r\n
connection: upgrade\r\n
sec-websocket-accept: 7eQChgCtQMnVILefJAO6dK5JwPc=\r\n
\r\n
```

Pour envoyer des données depuis le navigateur:
```
exampleSocket.send("Here's some text that the server is urgently awaiting!");
```

Pour recevoir des données du serveur depuis le navigateur:
```
exampleSocket.onopen = function (event) {
  exampleSocket.send("Here's some text that the server is urgently awaiting!"); 
};
```

https://developer.mozilla.org/en-US/docs/WebSockets/Writing_WebSocket_client_applications
http://msdn.microsoft.com/fr-fr/magazine/hh975342.aspx

## Les websockets sont t'ils prêts?

Oui et non.

Seuls les derniers navigateurs implémente la dernière version sécurisée (v13) de cette technologie:
http://caniuse.com/websockets
Firefox 6+, Google Chrome 14+ ,Opera 12.10+, Safari 6+ et Internet Explorer 10+, etc...

Les derniers serveurs savent les gérer: IIS 8.0+, NGINX 1.3+, Apache Tomcat 7, mod_websocket

Une solution pour palier à cela est d'utiliser des solutions de fallback à la manière de [Sockjs](https://github.com/sockjs) ou [engine.io](https://github.com/LearnBoost/engine.io) 

Cela permet d'utiliser les websockets lorsqu'ils sont implémentés au niveau du navigateur ou bien d'utiliser une autre methode tel que le long polling qui fonctionne sur tous les navigateurs. 

### Les websockets avec mojolicious

un exemple de chat mono-processus utilisant les websockets. 
https://gist.github.com/jberger/4702783

### Pub/Sub
exemple [Socket.io](http://socket.io/) qui utilise engine.io pour la communication bidirectionnelle et Redis avec un pattern Pub/sub pour gérer le broadcasting de message:
http://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern
https://github.com/marcusramberg/mojo-redis

On peut aussi utiliser un pattern Pub/Sub pour créer un bus de messages pour faire communiquer les différents workers d'une application.


## fil rouge du TP: après avoir récupéré des données voyons comment les stocker. 

Les informations importantes sont différentes pour les différents services que nous avons utilisé, covoiturage, avion, train, etc...
Nous décidons donc de tester un stockage des données de type documentaire en utilisant MongoDB. 
Cela nous permettra d'éviter de modéliser notre base en stockant directement les données reçus dans des collections de documents.

## interface avec mongoDB

* Pour démarrer avec mongoDB:
https://github.com/13pass/cours-2012---2013/blob/master/mongodb/intro.md

* Mango, un driver qui intègre Mojo::IOLoop pour requeter la base de données de façon syncrone ou asynchrone.
https://github.com/kraih/mango
Pas de documentation mais des exemples d'utilisations au niveau des différents tests unitaires:
https://github.com/kraih/mango/tree/master/t

* Le driver officiel synchrone
http://search.cpan.org/dist/MongoDB/
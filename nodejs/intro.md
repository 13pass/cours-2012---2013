#NodeJS

##Ressources utiles pour démarrer:

###Tutoriels :

* [Site officiel - NodeJS.org](http://nodejs.org/)<br/>
* [Node Manual](http://nodemanual.org/latest/)
* [Node Packaged Modules](https://npmjs.org/)
* [NodeTuts](http://nodetuts.com/)
* [How to Node](http://howtonode.org/)
* [Blog rolling with mongoDB, express and Node.js](http://howtonode.org/express-mongodb)
* [NodeBits](http://www.nodebits.org/)

###Screencasts :

* [Introduction to Node.js with Ryan Dahl](http://www.youtube.com/watch?v=jo_B4LTHi3I)
* [Google Tech Talk - Node.js: JavaScript on the Server](http://www.youtube.com/watch?v=F6k8lTrAE2g)
* [Server-side JavaScript with Node, Connect & Express](http://vimeo.com/18077379)
* [Nodecasts](http://nodecasts.net/)
* [NodeTuts](http://nodetuts.com/)


###Divers :

* [Bonnes pratiques sur les dépendances](http://blog.nodejitsu.com/package-dependencies-done-right)
* [Useful Node.js Tools, Tutorials And Resources](http://coding.smashingmagazine.com/2011/09/16/useful-node-js-tools-tutorials-and-resources/)
* [faciliter le debug de nodejs avec inspect](http://docs.nodejitsu.com/articles/getting-started/how-to-use-util-inspect)
* ["Callbacks are the modern goto"](http://elm-lang.org/learn/Escape-from-Callback-Hell.elm)

##Javascript:

* [Google Tech Talk - Javascript : The good parts](http://www.youtube.com/watch?v=hQVTIJBZook)
* [Crockford on Javascript](http://yuiblog.com/crockford/)
* [Eloquent Javascript](http://eloquentjavascript.net/)
* [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/JavaScript)

###JSON:

http://fr.wikipedia.org/wiki/JavaScript_Object_Notation

##Exercices :

### Exercice A :
En utilisant node.js, écrire une application web de chat à l'aide Socket.io



### Exercice B :  

En utilisant Mojolicious:

1) Faire une requete HTTP sur l'api de recherche de twitter en cherchant le terme 'node'

voir https://dev.twitter.com/docs/api/1/get/search 
et http://mojolicio.us/perldoc/Mojo/UserAgent

2) Mesurer le temps passé entre l'envoi de la requête et la fin de cette requête (en ms).

voir http://search.cpan.org/~zefram/Time-HiRes-1.9725/HiRes.pm


### Exercice C :

En utilisant node.js:

1) idem 1) de l'exercice B

voir http://nodejs.org/api/http.html

2) idem 2) de l'exercice B

voir http://www.w3schools.com/jsref/jsref_obj_date.asp

  



##Latence

(cf http://fr.wikipedia.org/wiki/Latence)

Examples de latence: 

* le délai entre une requête à un médium de stockage de données et le début du transfert de l'information demandée. Les latences les plus importantes sont causées par des déplacements mécaniques, par exemple sur un disque dur par le positionnement de la tête de lecture et la rotation du disque ;
* le délai entre une requête d'un client et la réponse du serveur ;

Globalement on peut avoir une latence importante dès lors qu'on effectue des entrées/sorties: http://fr.wikipedia.org/wiki/Entr%C3%A9es-sorties Car les temps d'accès aux disques et au réseaux sont importants.


## bloquant/non-bloquant

mode définissant comment le système accède à un péripherique.

* en mode bloquant une opération d'entrée/sortie ne retournera à l'application qu'une fois l'opération terminée.
* en mode non-bloquant une opération d'entrée/sortie retournera immédiatement à l'application mais sans le resultat de cette opération mais avec éventuellement un code de statut de l'opération ou une erreur. Plusieurs appels peuvent ensuite être requis pour surveiller l'état de cette opération.


## synchrone/asynchrone

type d'appel définissant le comportement du flot d'exécution d'un programme lors d'une opération d'entrée/sortie.

* Une opération d'entrée/sortie est dite synchrone si elle bloque le flot d'exécution jusqu'à ce que l'opération soit terminée.

* Une opération d'entrée/sortie est dite asynchrone si elle libère immédiatement le flot d'exécution, généralement avant que l'opération ne soit terminée.


## opération d'entrée/sortie synchrone et bloquante

Mode d'opération le plus commun, au niveau d'une application, une opération d'entrée/sortie ne nécessite qu'un seul appel et bloque l'application jusqu'à ce que l'opération soit terminée. Pendant ce temps de blocage l'application n'utilise pas d'unité processeur, le système d'exploitation peut donc passer la main à une autre application.


## opération d'entrée/sortie synchrone et non-bloquante

Plusieurs appels souvent nécessaire avant que l'opération ne soit terminée (polling)

## opération d'entrée/sortie asynchrone et bloquante

Permet de passer plusieurs descripteurs de fichier d'entrée/sortie lors d'un appel d'opération.

Des fonctions systèmes peuvent ensuite utiliser ces descripteurs pour suivre l'état d'une opération d'entrée/sortie  (exemple: select, poll, epoll and kqueue) dans ce cas ce sont ces appels de fonctions qui sont bloquants.

## opération d'entrée/sortie asynchrone et non-bloquante

Lors d'une opération d'entrée/sortie le flot d'exécution est immédiatement libéré. Une fois l'opération terminée un événement est émis ou une fonction de callback est executée. L'avantage de ce mode d'opération est d'éviter le blocage de l'application lors d'une opération d'entrée/sortie, l'application peut alors conserver la main sur l'unité de processeur alors que l'opération est toujours en cours. 


Ces 3 derniers modes d'opérations sont dit basé sur des événements (event-based)


##event-loop  

node.js utilisé une boucle d'évenement (event-loop).

Elle est basé sur libuv depuis la version 0.6

Cette boucle tourne tout au long d'un programme.

Pour résumer son action on pourrait l'écrire en pseudocode de la manière suivante:

```
while there are still events to process:  

    e = get the next event  
    
    if there is a callback associated with e:  
    
        call the callback
```

http://nikhilm.github.com/uvbook/basics.html


##Exercices :

### Exercice D : 

suite de l'exercice B (en Perl et synchrone)

1) Ajouter 2 autres requetes pour chercher les termes 'Perl' et 'Mojolicious'.  

2) Mesurer le temps passé pour l'execution de ces 3 requetes (en ms).  



### Exercice E :

suite de l'exercice C (en node.js)

1) idem 1) de l'exercice D.  

2) idem 2) de l'exercice D.  


##Synchronisation et coordination:  


La synchronisation controle l'accès aux ressources partagèes entre plusieurs activités. Pour eviter par exemple l'accès simultanée à une même ressource par 2 activités.

La coordination entre activité consiste à ce qu'une activité attende bien la fin d'une autre activité dont elle dépend. Par exemple une activité A attend la fin de l'execution d'une activité B dont elle nécessite un retour avant de poursuivre son execution.

L'une comme l'autre peuvent être implicites ou explicites.


* module avec ensemble de fonctions utiles pour la gestion asynchrone des événements en javascript: 

https://github.com/caolan/async


##Exercice F:

En vous inspirant du poste suivant:

http://dotheweb.posterous.com/nodejs-for-php-programmers-1-event-driven-pro

mettre en place une application web permettant de simuler la cuisson des pates.

Avec un bouton pour chaque action. Les actions seront grisés tant qu'il manquera des éléments pour les lancer (ex: on n'ajoute pas les pates tant que l'eau ne bout pas.)

Il n'y a qu'une saliere de disponible pour l'ensemble des cuisiniers.

* Remplir une casserolle d'eau -> 0,1 s
* Ajouter du sel -> 0.1 s
* Faire bouillir l'eau de la casserolle -> entre 9 et 10 s
* Peler et couper des tomates fraiches -> 1 s
* Préparer le soffritto -> 1.5 s
* Chauffer le soffritto -> 5 s
* Ajouter les pates -> 0.1s
* Ajouter les tomates, herbes, sels et poivres -> 0.2 s
* Cuisson des pates -> entre 5 et 7 s pour "aldente" entre 6 et 8 s pour "bien cuite"
* Tester l'état de cuisson des pates -> 0.1 s
* Vider l'eau des pates -> 0.1 s
* Servir avec du fromage -> 0.2 s 

Calculer le temps total pour la cuisson des pates

##Exercice E:  

Creer un bouton facebook connect. (voir graph.facebook.com)

Lors de la connection demander le droit de voir les évènements des amis l'utilisateur.

Une fois le token recupérer faire une requete avec graph api pour récuperer la liste des amis de l'utilisateur.

Pour chaque ami, récupérer la liste des événements de cet ami.

Pour chaque événement tester si l'event est public.

Si non ajouter un statut "private" à l'évenement et stocker le dans une collection d'évènements.

Si public alors voir si on a les données de latitude et longitude de l'adresse de l'évent.

Si ce n'est pas le cas alors tenter de géocoder l'adresse avec l'api

http://where.yahooapis.com/geocode?flags=GJ&appid=MON_APP_ID&q=10%20quai%20des%20chartrons,Bordeaux

Si qualité >50 alors recuperer les champs latitude et longitude et sauver l'event avec le statut à "yahoo_ok"


Si qualité <=50 alors geocoder avec l'api google map

Si geocode ok avec google, sauver l'event avec le statut à "google_ok"

Faites en sorte que même si on n'arrive pas à géocoder des évènements on les sauvegarde en base avec le statut "failure".

La sauvegarde serait faite sur une collection mongodb 'event'

Pour cela vous pouvez utiliser le module async.

```javascript
exports.graphGET = function(fbid,access_token, callback) {
  var testQuestionMark=fbid.split("?");
   
  if (testQuestionMark[1])
  {
    var path = fbid+'&access_token='+escape(access_token);
  }else
  {
    var path = fbid+'?access_token='+escape(access_token);

  }

  var options = {
  'host': 'graph.facebook.com',
  'port': 443,
  'path': path,
  'method': 'GET'
  };

  var req = https.request(options, function(res) {
    //console.log("statusCode: ", res.statusCode);
    //console.log("headers: ", res.headers);
    res.setEncoding('utf8');
    var text = "";
    res.on('data', function(chunk) {
      text += chunk;
    });
    res.on('end', function (chunk) {
      callback(res.statusCode, text, res.headers);
    });
  });
  req.end();

  req.on('error', function(e) {
    //console.error(e);
    callback(-1, e, null);
  });
};

```
#Audit de code:

Différents buts:  

* renforcer la fiabilité , la sécurité, la performance du code.
* déterminer la complexité du code d'un applicatif et en déduire sa maintenabilité.
* palier à l'absence de tests d'une application.


#Techniques plus en amont:

##la revue de code

http://fr.wikipedia.org/wiki/Revue_de_code
  
La revue de code (de l'anglais : « code review ») est un examen systématique du code source d'un logiciel.  

Il peut être comparé au processus ayant lieu dans un comité de lecture, l'objectif étant de trouver des bugs ou des vulnérabilités potentielles ou de corriger des erreurs de conception afin d'améliorer la qualité et la sécurité du logiciel.  

Une revue de code peut s'appuyer sur la vérification (manuelle ou automatisée) du respect d'un ensemble de règles de programmation.  

(On peut citer par exemple l'outil checkstyle sous un projet Eclipse). 

La revue de code devient de plus en plus une étape à part entière dans tout processus de développement logiciel.  

##le pair programming

Ou programmation en binôme
http://fr.wikipedia.org/wiki/Programmation_en_bin%C3%B4me

Utile pour  

* Avoir une certaine qualité du code, vise à remplacer la revue de code par une réflexion en amont.  

* Obtenir un code plus facile à maintenir et donc gagner du temps en terme de maintenance de code.  

* Former efficacement un développeur à des techniques ou à l'utilisation d'outils de développement.  

* Eviter que chaque partie d'un code ne soit dépendante que d'un seul développeur  

##La mise en place de tests

###Intérêt de tester du code.

* Garder un certain contrôle du comportement de l'application.
* Important en fonction de la criticité de l'application (données sensibles, sécurité, maintenabilité)

* test ergonomique (A/B testing) afin d'optimiser l'ergonomie d'une interface.


##Nouveaux outils:

* outil de gestion de contenu (gestion de versions décentralisée) => git
Effet collatéral  
=> Permet de détecter des bugs plus rapidement.  

=> Simplifie la synchronisation des codes de développement et de production. 






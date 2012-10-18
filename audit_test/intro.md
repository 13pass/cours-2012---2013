#Audit de code:

Différents buts:  

* renforcer la fiabilité , la sécurité, la performance du code.
* déterminer la complexité du code d'un applicatif et en déduire sa maintenabilité.
* pallier l'absence de tests d'une application.


#Techniques plus en amont:

##La revue de code

http://fr.wikipedia.org/wiki/Revue_de_code
  
La revue de code (de l'anglais : « code review ») est un examen systématique du code source d'un logiciel.  

Il peut être comparé au processus ayant lieu dans un comité de lecture, l'objectif étant de trouver des bugs ou des vulnérabilités potentielles ou de corriger des erreurs de conception afin d'améliorer la qualité et la sécurité du logiciel.  

Une revue de code peut s'appuyer sur la vérification (manuelle ou automatisée) du respect d'un ensemble de règles de programmation.  

(On peut citer par exemple l'outil checkstyle sous un projet Eclipse). 

La revue de code devient de plus en plus une étape à part entière dans tout processus de développement logiciel.  

##Le pair programming

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


###Définition d'un test:

Un test permet de confronter le comportement d'un programme à une spécification attendue. 

Il permet de statuer sur le succès ou sur l'échec d'une ou plusieurs vérifications de fonctionnement du programme.


###Deux types de tests couramment utilisés:

* Le test unitaire:  

Le test unitaire est un procédé permettant de s'assurer du fonctionnement correct d'une partie déterminée d'un logiciel ou d'une portion d'un programme appelée « unité » ou « module ».  

* Le test d'intégration

Les tests d'intégration ont pour but de valider le fait que toutes les parties d'un programme développées indépendamment fonctionnent bien ensemble de façon cohérente et conformément aux spécifications.   

# TDD (Test Driven Developement)

#Principe  

Technique de développement de logiciel piloté par les tests, elle préconise d'écrire le test d'une fonctionnalité avant d'écrire le code implémentant cette fonctionnalité. Elle préconise aussi de ne pas écrire de nouveaux tests tant que les tests précedents ne sont pas implémentés et que leurs tests associés passent avec succès.

## Exemple

https://github.com/Ajaxman/TDD

Etapes :

1. Ecrire le test
2. Vérifier que le test échoue
3. Ecrire le code suffisant pour que le test réussisse
4. Vérifier que le test réussise.
5. Implémenter la fonctionnalité.
6. Vérifier que le test réussise (idem 4).

###résumé mnemotechnique en 3 grandes étapes:  

1) Red - échec du test  

2) Green - succès du test  

3) Refactor - refactorisation du code  


Processus détaillé: http://bruno-orsier.developpez.com/tutoriels/TDD/pentaminos/#LII

##TDD + logiciel de version décentralisé (ex:git)
* Detection et correction des bugs au plus vite. 
* Refactorisation plus sûre et rapide. Non régression du code.

http://fr.wikipedia.org/wiki/Refactorisation

Les programmes ont une vie et doivent s'adapter à leur environnement, cela implique de pouvoir refactoriser son code en s'assurant que l'ensemble des fonctionnalités du programme soient préservées. On parle alors de "non régression" du code.

* Intégration continue. http://fr.wikipedia.org/wiki/Int%C3%A9gration_continue

Elle peut être automatisée en utilisant par exemple le principe suivant:

Toutes les nuits un script estampillera une nouvelle version du logiciel (release) en prenant la dernière version commitée et synchronisée avec le dépot de référence dont l'ensemble des tests passent avec succès.

#aussi vu pendant le cours

* test ergonomique (A/B testing) afin d'optimiser l'ergonomie d'une interface.



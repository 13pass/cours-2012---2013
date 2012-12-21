#MongoDB

## Ressources utiles pour démarrer:

* console en ligne avec tutorial sur mongoDB: http://try.mongodb.org/  

* cours et certification en ligne gratuites: https://education.10gen.com/  

#Scalabilité et partitionement

* scalabilité:

La « scalabilité » peut faire référence à la capacité d'un système à accroître sa capacité de calcul sous une charge accrue quand des ressources sont ajoutées

En développement web on parle de scalabilité horizontale ou verticale d'une application selon le type de ressources ajoutées pour répondre aux besoins de montée en charge de l'application.

* scalabilité verticale 

Possibilité d'upgrader le ou les serveurs utilisés par l'application (ajout de processeurs, RAM, disques…).

* scalabilité horizontale 

Possibilité d'ajouter de nouveaux serveurs à une grappe de serveur utilisés par l'application.

  
* scalabilité d'une base de données  


La base de données étant souvent le composant le plus critique au niveau d'une application web, c'est souvent elle qui bénéficie en premier des procédure d'augmentation de montée en charge. L'upgrade du matèriel d'un serveur de base de données peut rapidement atteindre ses limites, de plus le fait de n'utiliser qu'un seul serveur aussi puissant soit t'il n'empèche pas ce serveur de subir des arrêts du à des pannes ou de la maintenance.

Pour éviter des arrêts intempestifs de la base de données, qui seraient répercutés sur l'application, et assurer une continuité de service on utilisera alors un cluster de serveurs avec replication des données entre ces différents serveurs. Cela permet dans le même temps d'outrepasser les limites de scalabilité en terme d'upgrade des serveurs en augmentant le nombre de serveur du cluster au fur et à mesures des besoins en ressources matérielles. 

Le sharding correspond à une autre technique de scalabilité horizontale qui permet de répartir les données entre différents serveurs.

Le sharding et la replication de base de données peuvent être utilisés conjointement en utilisant par exemple un cluster de shard repliqués.

![cluster de shard repliqués](https://github.com/edelight/chef-mongodb/wiki/Replicated_and_Sharded.png)

Ces 2 techniques conduisent à un partitionnement de la base de données et amènent leur lot de problématiques nouvelles.

##Theoreme de CAP

http://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_CAP

![Théororeme de Brewer](https://raw.github.com/13pass/cours-2012---2013/master/mongodb/theoreme_de_brewer.png)

Les systèmes de gestion de bases de données NoSQL sont conçu pour favoriser la scalabilité des base de données en facilitant la mise en place de sharding et de replication de données. Elles prévoient donc dès le départ un partitionement futur des base données.

Dans le cas de NoSQL on peut en déduire un choix de contraintes résultantes du théorème de CAP.

![Résultante de Brewer NoSQL](https://raw.github.com/13pass/cours-2012---2013/master/mongodb/resultante_nosql_de_brewer.png)



#Comparaison relationelle et documentaire
Table <=> Collection
Enregistrement <=> Document
Relation <=> Lien vers document

http://docs.mongodb.org/manual/reference/sql-comparison/

#Conception de base mongodb

En théorie pas de schema de base de données en Nosql, en pratique la plupart des documents que l'on stocke dans une collection de documents suivent un schema implicite (champs revenant régulièrement) ou explicite (champs indéxés). 
La partie implicite du schema est souvent une conséquence des choix de structure de données fait au niveau applicatif. En créant des indexes sur des champs spécifiques on désigne de façon explicite que ces champs font partie du schéma de la base de données et peuvent imposer des contraintes comme par exemple l'unicité de valeur d'un champ ou d'une combinaison de champs.

Il faut ensuite définir les différentes collections de documents. Cela implique des choix à faire sur l'opportunité d'embarquée certaines informations dans un document ou d'embarqué un lien vers un autre document contenant ces informations.

Par exemple: une collection "event" peut embarquer un tableau avec la liste des participants à l'événement, l'information sur les participants peut être embarquée dans un document de la collection "event" ou bien stockée sous forme de document dans une autre collection "participant", dans ce cas il suffit de garder un identifiant de chaque participant lié à un document de la collection "participant". 


Les choix de conception sont liés à des problématiques concernant:  

* les requêtes les plus courantes.  

* le choix des clès de sharding.  

* l'atomicité des operations.  

http://www.journaldunet.com/developpeur/tutoriel/theo/060615-theo-db-acid.shtml
http://docs.mongodb.org/manual/tutorial/isolate-sequence-of-operations/

Typiquement on peut faire des opérations atomiques avec mongoDB si ces opérations concernent un seul et même document. En d'autres termes pour faire des opérations atomiques sur des données il faut que ces données se trouvent dans le même document.


##Partie pratique


travailler les fonctions et opérateurs de requêtes:

* http://docs.mongodb.org/manual/reference/operators/  on ne s'intéresse pas aux opérateurs geospatiaux pour l'instant

* Faire une requête sur le 1er élement d'un tableau  

http://docs.mongodb.org/manual/core/document/#dot-notation


* Mettre a jour l'élement du tableau qu'on a requeté en utilisant l'opérateur de position '$'  

* Comprendre la structure d'un objectId  

http://docs.mongodb.org/manual/core/object-id/

#mongodump et mongoimport 

https://www.youtube.com/watch?v=ZWnHhKiApVU

#Framework d'aggregation

Equivalent du GROUP BY en SQL.

Cas particulier de Map Reduce

https://www.youtube.com/watch?v=OOciY22Eqpc
https://www.youtube.com/watch?v=5ApeWrsjOJY

## Pipeline et Expressions

http://docs.mongodb.org/manual/reference/sql-aggregation-comparison/#sql-to-aggregation-framework-mapping-chart

$match  

$project  

$group  

$sort  

$limit  

$unwind  


#divers operateurs 
http://docs.mongodb.org/manual/reference/aggregation/

##Exercices sur les aggregats:

* Récuperer les 30 évenements regroupant le plus de participants feminins.  

* Récuperer les ids des participants masculins avec la liste des evenements auxquels ils sont inscrits.  

* Récuperer le nombre d'évenement par jour de la semaine du début de l'évenement sur les 2 derniers mois.  


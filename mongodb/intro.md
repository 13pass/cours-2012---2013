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

Pour convertir les données en ISODATE à partir de chaine ISO, utiliser la fonction ISODate()  

db.event.update({_id:ObjectId("4f59d2a85cd1772f24000246")},{$set:{start_time:ISODate("2012-03-03T13:00:00")}})


#Replica set

La réplication des bases de données permet la redondance et la sauvegarde des données d'une base.

Au niveau de mongoDB elle s'organise par la mise en place d'un cluster d'instances de serveur de base de données (mongod). Les données de ses instances sont repliquées entre l'une et l'autre des instances et ce groupe est appelé "Replica sets".

Une organisation est nécessaire à la bonne réplication des données au sein d'un replica set, pour cela chaque replica set possède une et une seule instance de mongod désignée comme primaire, les autres instances étant alors secondaire.

Dans cette configuration seule l'instance primaire peut recevoir les requêtes d'écriture (insert et update) à la base et c'est elle qui réplique ensuite ces données sur les autres instances du replica set.


##Exercices sur les 'replica set':

* Créez un replica set par groupe, avec une instance de mongod pour chaque machine du groupe. 

* Si vous avez que 2 machines à configurer alors vous configurez un arbitre sur une des 2 machines. 

http://docs.mongodb.org/manual/replication/
http://www.kchodorow.com/blog/2012/06/26/replica-set-internals-part-v-initial-syn

##Read preference

Depuis la version 2.2 est apparu la notion de read preference. Cela permet pour une application qui envoi des requêtes en lecture de définir des règles de lecture qui auront un impact sur la charge des replica:

Il existe 5 modes de lecture depuis une application:

* primary

Toutes les opérations de lecture n'utilisent que l'instance primaire du replica set. C'est le comportement par défaut. Si le primaire n'est pas disponible, les opérations de lecture produiront une exception.

* primaryPreferred

Dans la plupart des situations, les opérations de lecture s'effectuent depuis l'instance primaire du replica. Cependant, si l'instance primaire n'est pas disponible, les opérations de lecture s'effectuent depuis les instances secondaires.

* secondary

Les opérations de lecture ne s'effectuent que sur les instances secondaires du replica. Si aucune instance secondaire n'est disponible, les opérations de lecture produiront une exception.

* secondaryPreferred

Dans la plupart des situations, les opérations de lecture s'effectuent sur les instances secondaires, mais dans le cas où le replica set contient un seul primaire avec aucune autre instance, l'opération de lecture utilisera l'instance primaire.

* nearest

On ne prend pas en considération le type du membre, l'idée étant de lire sur l'instance qui répond le plus rapidement (souvent la plus proche géographiquement) aux requêtes du client qu'elle soit primaire ou secondaire.


http://docs.mongodb.org/manual/applications/replication/




# limite de la replication

La replication des données avec mongoDb permet de distribuer les requêtes en lecture entre plusieurs instances de mongod qui peuvent être multipliés au besoin. Elle est cependant impossible en l'état pour distribuer les requêtes en ecriture qui sont toutes envoyé sur la même instance primary.

Pour distribuer les requêtes en ecritures entre plusieurs instances il faut alors décider de creer un sharding pour les collections les plus exposées.

# Sharding

## choix d'une clef de sharding

Pour sharder une collection il faut décider des critéres qui vont permettre de rediriger une requête sur tel ou tel shard. On utilise pour cela une clef de sharding qui créer un index sur un ou plusieurs champs de la collection.

Le choix d'une clef de sharding d'une collection de documents est crucial pour un tas de raisons listées ci-dessous, d'autant plus que cette opération est difficilement reversible:
http://docs.mongodb.org/manual/faq/sharding/#faq-change-shard-key

ce choix dépend du schema implicite de données de la collection à sharder et des requêtes utilisés aussi bien en lecture ou écriture sur la base de données.


Une clef appropriée doit pouvoir satisfaire de près ou de loin les critères suivant:

* être facilement divisible afin que mongodb puisse distribuer le contenu d'une collection shardée au travers de différents shard qui la compose. Si les valeurs des champs correspondant à la clef de shard sont toutes identiques au niveau d'un ensemble de document, ces derniers se retrouveront tous dans un même shard qui risque de grossir sans jamais pouvoir être divisé en plusieurs shard. (voir section cardinalité ci dessous) 

* evite la concentration des requêtes d'ecriture sur un nombre limité de shard. Une clef de sharding dont les champs sont liés au moment de l'insertion (heure ou date) sont par exemple à eviter car cela risque de rediriger toutes les requêtes d'ecriture sur le même shard. 

* permet aux instances de mongo de retourner le resultats de la plupart des requêtes en interrogeant un seul shard. Pour cela il vaut mieux utiliser une clef comportant les champs courramment utilisés par les requêtes les plus populaires.  
http://docs.mongodb.org/manual/core/sharding-internals/#query-isolation

##cardinalité:

La cardinalité est importante au niveau du choix d'une clef de sharding car mongoDb regroupe les documents en fonction des clef de sharding.

* cardinalité faible
Moins d'une centaine de valeur différentes
exemple: statut, iso_language_code

Imaginons le sharding d'une collection de documents dont la clef de shard serait 'statut' avec les valeurs possibles suivantes: "active","expired","removed","pending" 

Avec 4 valeurs possibles différentes pour cette clef de sharding mongoDB ne pourra pas créer plus de 4 shard pour cette collection, ce qui limite fortement le partitionement de cette collection.

* cardinalité moyenne
nombre de valeur différentes important mais certaines valeurs regroupe un nombre important de documents
exemple: code postal 

Il y a environ 2 millions de personnes vivant à Paris répartit sur 20 code postaux différents ce qui signifie que chaque code postal peut regrouper en moyenne 100 000 personnes ce qui peut conduire à des shard de taille conséquentes.

* cardinalité forte

exemple: numéro de téléphone, la plupart des documents auront un numéro de téléphone unique.


Pour augmenter la cardinalité d'une clef on peut aussi la composer de plusieurs champs.


##remarques

http://docs.mongodb.org/manual/faq/sharding/#faq-change-shard-key 

##deploiement d'un cluster de shard

http://docs.mongodb.org/manual/core/sharding/
http://docs.mongodb.org/manual/tutorial/deploy-shard-cluster/
http://docs.mongodb.org/manual/administration/sharding/#set-up-a-sharded-cluster
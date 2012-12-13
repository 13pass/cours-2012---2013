#MongoDB

## Ressources utiles pour démarrer:

* console en ligne avec tutorial sur mongoDB: http://try.mongodb.org/  

* cours et certification en ligne gratuites: https://education.10gen.com/  

#Scalabilité et partitionement

* scalabilité:

La « scalabilité » peut faire référence à la capacité d’un système à accroître sa capacité de calcul sous une charge accrue quand des ressources sont ajoutées

En développement web on parle de scalabilité horizontale ou verticale d'une application selon le type de ressources ajoutées pour répondre aux besoins de montée en charge de l'application.

* scalabilité verticale
Possibilité d’upgrader le ou les serveurs utilisés par l'application (ajout de processeurs, RAM, disques…).

* scalabilité horizontale
possibilité d’ajouter de nouveaux serveurs à une grappe de serveur utilisés par l'application.


La base de données étant souvent le composant le plus critique au niveau d'une application web, c'est souvent elle qui bénéficie en premier des procédure d'augmentation de montée en charge. L'upgrade du matèriel d'un serveur de base de données peut rapidement atteindre ses limites, de plus le fait de n'utiliser qu'un seul serveur aussi puissant soit t'il n'empèche pas ce serveur de subir des arrêts du à des pannes ou de la maintenance.

Pour éviter des arrêts intempestifs de la base de données, qui seraient répercutés sur l'application, et assurer une continuité de service on utilisera alors un cluster de serveurs avec replication des données entre ces différents serveurs. Cela permet dans le même temps d'outrepasser les limites de scalabilité en terme d'upgrade des serveurs en augmentant le nombre de serveur du cluster au fur et à mesures des besoins en ressources matérielles. 

Le sharding correspond à une autre technique de scalabilité horizontale qui permet de répartir les données entre différents serveurs.

Le scharding et la replication de base de données peuvent être utilisés conjointement en utilisant par exemple un cluster de shard repliqués.

![cluster de shard repliqués](https://github.com/edelight/chef-mongodb/wiki/Replicated_and_Sharded.png)


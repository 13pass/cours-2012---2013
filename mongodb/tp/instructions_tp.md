TP à réaliser en Perl en utilisant le framework Mojolicious (Lite ou Full). Le code source de l'application sera hébergé sur github.  

Le TP est à faire en groupe comme indiqué en cours.  


Le TP est composée de 3 partie, la première étant à faire par tous les groupes, une seule des 2 autres parties (2ème et 3ème) est à faire au choix du groupe avant la première du Vendredi 25 Janvier pour la présentation d'une première maquette de l'application (pas forcèment fonctionnelle).  

La première partie devra permettre les fonctionnalitès suivantes:  

1. Permettre de se connecter à un serveur de base de données mongoDB en renseignant l'ip et le port du serveur.  

2. Lister les bases de données d'un serveur mongodb.  

3. Lister les collections d'une base de données.  

4. deduire un schema global d'une collection de document avec pour chaque champs trouvé:  
* le nombre de document dans lequel ce champ est présent entre parenthèse (). Un clic sur ce nombre entre parenthèse générera une requête editable permettant de visualiser l'ensemble des documents contenant ce champ. Une fois editée par l'utilisateur la requête pourra être lancé à nouveau, les résultats seront affiché en dessous.  
* le nombre de document pour lequel ce champ contient une liste de valeur ou de document entre crochets []. Un clic sur ce nombre entre crochets générera une requête editable permettant de visualiser l'ensemble des documents pour lesquels ce champ représente une liste de valeur ou de documents. Une fois editée par l'utilisateur la requête pourra être lancé à nouveau, les résultats seront affiché en dessous.  
* le nombre de document pour lequel ce champ contient un document embarqué entre balises <>. Un clic sur ce nombre entre balises génèrera le schéma deductible de ce documents embarqué juste en dessous du schema du niveau supèrieur. On devra pouvoir descendre jusqu'à 2 niveaux de documents embarqués.  

La seconde partie devra permettre les fonctionnalitès suivantes:  

1. La detection des indexes géospatiaux de types "2d" et l'ajout d'un indicateur au niveau de ces champs.
http://www.mongodb.org/display/DOCS/Geospatial+Indexing  
2. L'affichage d'une carte en complément de l'affichage Json des résultats d'une requête lorsque les resultats de cette requête contiennent un champ geospatial indexé. On affichera un curseur avec l'_id de chaque document sur la carte à l'aide des informations géospatiales.  
3. Une fois la carte affichée on pourra cliquer sur un point de la carte et génerer une requête pour récupérer les 25 documents dont la valeur du champ géospatial est la plus proche.  


La troisième partie consiste à adapter une partie d'un applicatif open source afin de réutiliser des fonctionnalités déjà implémentées.  

L'idée étant de réimplémenter la partie API backend de l'application https://github.com/bobthecow/genghis. Cette partie serait alors réimplémentée en utilisant le framework Mojolicious et permettrait d'utiliser la partie frontend de genghis qui est basée sur le framework backbone.js.  

L'API est constitué du routage suivant:  
```json
routes: {
        '': 'index',
        'servers': 'redirectToIndex',
        'servers/:server': 'server',
        'servers/:server/databases': 'redirectToServer',
        'servers/:server/databases/:database': 'database',
        'servers/:server/databases/:database/collections': 'redirectToDatabase',
        'servers/:server/databases/:database/collections/:collection?*query': 'redirectToCollectionQuery',
        'servers/:server/databases/:database/collections/:collection': 'collection',
        'servers/:server/databases/:database/collections/:collection/documents': 'redirectToCollection',
        'servers/:server/databases/:database/collections/:collection/documents?*query': 'collectionQuery',
        'servers/:server/databases/:database/collections/:collection/documents/:documentId': 'document',
        '*path': 'notFound'
    }
```
voir https://github.com/bobthecow/genghis/blob/master/src/js/genghis/router.js  

Cela permettrait d'avoir une base sur laquelle on viendrait ajouter les fonctionnalités de la première partie du TP.  

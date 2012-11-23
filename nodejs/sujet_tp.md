##TP à faire en binôme, à rendre pour le 7 décembre 2012.

Pas de compte-rendu nécessaire mais une adresse de dépot github référent et le lien des commits faisant état d'une livraison de version (0.X, 1.X et 2.X) à envoyer par email avec la composition du binôme à vincent.hetru@13pass.com

Chaque binôme utilisera des pull-request ou des collaborateurs pour intégrer le code de chacun des étudiants du binôme au dépot référent.

chaque étudiant pensera à commiter régulièrement son travail d'implémentation. 

L'application est à faire avec node.js en utilisant un framework MVC (express, geddy ou meteor) et éventuellement avec une base de donnée (mongo.db conseillée).

Le but de ce TP est de créer une application de chat web.

###Version 0.X : 

On reprend le chat fait en node.js avec une unique chatroom, mais cette fois on va chercher à faire une partie historique des discussions en générant une page html par discussion ayant lieu sur la chat room, l'idée étant d'avoir une page unique par discussion identifiée par un permalink contenant, d'une part, la premiere phrase de la discussion de plus de 5 mots du chatteur ayant initié la discussion, d'autre part, le pseudo du chatteur.

Pour cela il faut pouvoir dissocier les discussions qui peuvent être multiples sur le chat.

On prend pour critère de déterminer la fin d'une discussion lorsqu'aucun message de chat n'aura été emis par les utilisateurs du chat pendant 5 minutes sans interruption. On va alors enclencher la création d'une page relative à cette discussion qui reprendra et affichera le contenu du chat dans l'ordre de la discussion avec devant chaque message le pseudo du chatteur émetteur. Ce lien sera affiché dans le flot de message du chat.

Chaque page de discussion comportera 1 logo avec un lien vers la page d'accueil, 1 lien vers la page de la discussion précédente, et si elle existe, un lien vers la page de la discussion suivante.


###Version 1.X:

Vu le succès de l'appli et comme suggéré par les utilisateurs du chat nous allons donner la possibilité aux utilisateurs de rejoindre ou de créer plusieurs salons de chat ayant chacun un sujet de discussion. Chaque salon sera identifié par un tag (exemple #node.js , #mojolicious, #mongodb) ainsi les discussions ne seront plus mélangées.

###Version 2.X:

On se rend compte que certaines discussions sont très courtes ce qui donne des pages de discussions avec peu de contenu, ce qui est plutôt négatif en terme de référencement. 
Un de vos amis qui fait du SEO (Search Engine Optimization) vous suggère lors des discussions d'inclure des tweets de la même langue (français) relatif au sujet du salon en recherchant les tweets comportant un tag ayant le même intitulé. L'idée serait de les placer dans la discussion en utilisant le pseudo du compte twitter et le text associé au tweet.
introduction a git 1
http://www.youtube.com/watch?v=ULRN0vS4Wtk

introduction a git2
http://www.youtube.com/watch?v=IEmgXsoV35w

Atelier pratique
http://www.youtube.com/watch?v=qPo7YPB6EFM

Tutoriel intératif:
http://try.github.com

Git: un outil de gestion de contenu de type DVCS.

http://fr.wikipedia.org/wiki/Gestion_de_version_d%C3%A9centralis%C3%A9e#Gestion_de_versions_d.C3.A9centralis.C3.A9e

Installation de git:

http://progit.org/book/fr/  

git clone git://git.kernel.org/pub/scm/git/git.gitch1-4.html

Configuration de git:

http://progit.org/book/fr/ch1-5.html#votre_identit

Création d'un dépot:

http://progit.org/book/fr/ch2-1.html#initialisation_dun_dpt_git_dans_un_rpertoire_existant

Creation d'un depot pour notre application twitter.

à la racine de notre projet on lance la commande 

git init

En résumé

Créer un nouveau dépot dans un répertoire
git init

Editer le fichier .gitignore pour ajouter les fichiers que vous ne souhaitez pas/plus commiter dans votre depot

"Tracker" les nouveaux fichiers (prendre en compte les nouveaux fichiers pour les futurs commits)
	
git add .

Commiter tous les fichiers auxquels des modifications ont été apportés (tous les fichiers modifier passe en status "stage" grace au -a)
	
git commit -am "Message de commit"



Bug tracking


git log invoqué sans argument énumère en ordre chronologique inversé les commits réalisés. Cela signifie que les commits les plus récents apparaissent en premier. Cette commande indique chaque commit avec sa somme de contrôle SHA-1, le nom et l'e-mail de l'auteur, la date et le message du commit.


Une des options les plus utiles est -p, qui montre les différences introduites entre chaque validation. Vous pouvez aussi utiliser -2 qui limite la sortie de la commande aux deux entrées les plus récentes :

git log –p -2
git log --pretty=format:"%h %s" --graph
git log --since=2.weeks
git log --pretty="%h — %s" --author=michel --since="2008-10-01" --before="2008-11-01" --no-merges -- t/
=> Liste des commits modifiant les fichiers de test dans l'historique du source de Git ont été validés par Michel et n'étaient pas des fusions durant le mois d'octobre 2008





Les branches

Il est très souvent utile de créer des branches pour se séparer de la branche principale "master" et éviter de perturber le travail des autres développeurs.


Lister les branches et voir la branche en cours
	
git branch

Créer une nouvelle branche en se basant sur la révision actuellement utilisée (HEAD par défaut)
	
git checkout -b <nom de la nouvelle branche>

Il est souvent utile de "merger" les modifications d’une branche dans master
	
git checkout master
git merge <branche à fusionner dans master>	
git branch -d <branche à supprimer> # si la branche n’est plus utile, il est possible de la supprimer





Les remotes

Ajouter un "remote", c’est à dire un serveur distant ou envoyer le dépot local
	
git remote add <nom du remote> <url du remote> 

"origin" est le serveur à utiliser par défaut. Un remote est simplement un emplacement, cela peut-être un chemin vers Dropbox, un repertoire accessible en SSH, etc...
Par exemple pour github:
	
git remote add origin ssh://git@github.com:username/your_repo

va ajouter les lignes suivantes au niveau du fichier .git/config

[remote "origin"]
  url = ssh://git@github.com:username/your_repo
  fetch = +refs/heads/*:refs/remotes/origin/*


Si l'on "pull" et "push" regulierement sur le master d'origin (ce qui est souvent le cas) on peut configurer les push et pull pour prendre par défaut le remote "origin" définit précédemment sur la branche "master"
[branch "master"]
  remote = origin
  merge = refs/heads/master


Les commandes pull et push peuvent ensuite être utilisées de façon minimale:
	
git pull
git push



Envoyer une branche, un tag:
	
git push origin <nom de la ressource>

Il est nécessaire de récupérer les dernière modifications, faites par les autres développeurs depuis le dépot distant, avant de faire un push. 
	
git pull

Les modifications distantes vont être récupérées et "mergées" dans la branche courante. 
S’il n’y aucun problème, un commit sera créé avec les modifications distantes inclues. 
Il suffit ensuite de pusher, pour envoyer tout ça sur le "remote".


Pour ceux qui veulent utiliser Git avec Windows et TortoiseGit, vous pouvez suivre le tuto suivant :

http://uncod.in/blog/github-tortoisegit-and-organizational-workflow-tutorial/

Pour générer votre clé SSH, vous pouvez utiliser PuttyGen.
Si le premier clone ne fonctionne pas, essayez de vous connecter une fois à votre dépot GitHub à partir de Putty et acceptez de stocker la clé dans le cache.
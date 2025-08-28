#!/bin/bash

# on vérifie si l'utilisateur a bien fourni au moins 1 argument

if [ $# -lt 1 ]; then
    # l'utilisateur a fourni moins de 1 argument, on lui met un message d'erreur
    echo "Merci de fournir le chemin du dossier à sauvegarder en argument !"
    echo "Utilisation : ./exercice2.sh /chemin/vers/dossier_a_sauvegarder"

    exit 1
    
fi

# on récupère le dossier à sauvegarder envoyé en argument
dossier=$1

# on vérifie si le dossier existe et est bien un dossier, sinon on pourra rien sauvegarder
if [ ! -d $dossier ]; then
    # si on rentre dans ce if, c'est que le dossier n'existe pas, ou n'est pas un dossier
    echo "Erreur, $dossier n'est pas un dossier valide."

    exit 2 # code retour différent, pour pouvoir identifier/documenter les différents types d'erreurs de mon script
fi

echo "Lancement de la sauvegarde ..."

# on récupère la date et heure actuelle avec la commande date
now=$(date +'%d-%m-%Y_%H-%M-%S')

# compression du dossier dans une archive tar gz
tar -czvf sauvegarde_$now.tar.gz $dossier

# si on voulait plutôt créer une archive zip :
#zip -r sauvegarde_$now.zip $dossier

echo "Sauvegarde terminée !"
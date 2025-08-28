#!/bin/bash

# Vérifier qu'on a bien 2 arguments

if [ $# -lt 2 ]; then
    # l'utilisateur a fourni moins de 2 arguments, on lui met un message d'erreur
    echo "Merci de fournir 2 arguments à ce script !"
    echo "Utilisation : ./exercice1.sh /chemin/vers/dossier_source /chemin/vers/dossier_cible"

    exit 1
fi
    

# On récupère les deux dossiers (source et cible) envoyés en argument
dossier_source=$1
dossier_cible=$2

# on vérifie si le dossier source existe et est bien un dossier, sinon on pourra rien copier
if [ ! -d $dossier_source ]; then
    # si on rentre dans ce if, c'est que le dossier source n'existe pas, ou n'est pas un dossier
    echo "Erreur, $dossier_source n'est pas un dossier valide."

    exit 2 # code retour différent, pour pouvoir identifier/documenter les différents types d'erreurs de mon script
fi

echo "Lancement de la copie ..."

# on vérifie si le dossier cible existe
if [ -d $dossier_cible ]; then
    # si le dossier existe, on copie les fichiers
    cp -r -v $dossier_source/* $dossier_cible
else
    # si le dossier n'existe pas, on le créé
    mkdir $dossier_cible
    cp -r -v $dossier_source/* $dossier_cible
fi

echo "Copie terminée."
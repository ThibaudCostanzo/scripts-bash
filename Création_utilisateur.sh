#!/bin/bash

# on vérifie si l'utilisateur a bien fourni au moins 1 argument
if [ $# -lt 1 ]; then
    # l'utilisateur a fourni moins de 1 argument, on lui met un message d'erreur
    echo "Merci de fournir le nom de l'utilisateur à créer en argument !"
    echo "Utilisation : ./exercice4.sh alice"

    exit 1
fi

# on récupère le nom de l'utilisateur à créer envoyé en argument
username=$1

# ce script nécessite d'être lancé avec les droits root, donc on vérifie si c'est le cas !

if [[ $EUID -ne 0 ]];
then
    echo "Ce script nécessite les droits root, lancement avec sudo..."
    exec sudo /bin/bash "$0" "$@"
fi

echo "Création de l'utilisateur..."

# on ajoute l'utilisateur
useradd -m $username

# on génère un mot de passe et l'affiche
password=$(openssl rand -base64 16 | tr -dc 'A-Za-z0-9')
echo "Mot de passe de l'utilisateur $username : $password"

# lui attribue un mot de passe par défaut aléatoire (et l'affiche à l'écran), 
echo "$username:$password" | chpasswd

echo "Utilisateur $username créé avec succès !"
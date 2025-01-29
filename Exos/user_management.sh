#!/bin/bash

add_user() {
    read -p "Entrez le nom d'utilisateur à ajouter: " username
    sudo useradd "$username"
    if [ $? -eq 0 ]; then
        echo "Utilisateur $username ajouté avec succès."
        sudo passwd "$username"
    else
        echo "Échec de l'ajout de l'utilisateur $username."
    fi
}

delete_user() {
    read -p "Entrez le nom d'utilisateur à supprimer: " username
    sudo userdel "$username"
    if [ $? -eq 0 ]; then
        echo "Utilisateur $username supprimé avec succès."
    else
        echo "Échec de la suppression de l'utilisateur $username."
    fi
}

list_users() {
    cut -d: -f1 /etc/passwd
}

while true; do
    echo "Menu:"
    echo "1. Ajouter un utilisateur"
    echo "2. Supprimer un utilisateur"
    echo "3. Lister les utilisateurs"
    echo "4. Quitter"
    read -p "Choisissez une option: " option

    case $option in
        1)
            add_user
            ;;
        2)
            delete_user
            ;;
        3)
            list_users
            ;;
        4)
            echo "Quitter"
            break
            ;;
        *)
            echo "Option invalide. Veuillez choisir une option valide."
            ;;
    esac
done

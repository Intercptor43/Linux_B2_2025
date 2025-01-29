  #!/bin/bash
  
  directory=""
  file=""
  
  while true; do
      echo "\nMenu:"
      echo "1. Créer un répertoire"
      echo "2. Créer un fichier"
      echo "3. Écrire du contenu dans le fichier"
      echo "4. Afficher le contenu du fichier"
      echo "5. Supprimer le fichier et le répertoire"
      echo "6. Quitter"
      read -p "Choisissez une option: " option
  
      case $option in
          1)
              read -p "Entrez le nom du répertoire: " directory
              mkdir -p "$directory"
              echo "Répertoire '$directory' créé."
              ;;
          2)
              if [ -z "$directory" ]; then
                  echo "Veuillez d'abord créer un répertoire."
              else
                  read -p "Entrez le nom du fichier: " file
                  touch "$directory/$file"
                  echo "Fichier '$file' créé dans '$directory'."
              fi
              ;;
          3)
              if [ -z "$file" ]; then
                  echo "Veuillez d'abord créer un fichier."
              else
                  read -p "Entrez le contenu du fichier: " content
                  echo "$content" > "$directory/$file"
                  echo "Contenu ajouté au fichier '$file'."
              fi
              ;;
          4)
              if [ -z "$file" ]; then
                  echo "Veuillez d'abord créer un fichier."
              else
                  echo "Contenu du fichier '$file':"
                  cat "$directory/$file"
              fi
              ;;
          5)
              if [ -z "$directory" ]; then
                  echo "Aucun répertoire à supprimer."
              else
                  rm -rf "$directory"
                  echo "Répertoire '$directory' et son contenu supprimés."
                  directory=""
                  file=""
              fi
              ;;
          6)
              echo "Fermeture du script."
              exit 0
              ;;
          *)
              echo "Option invalide, veuillez réessayer."
              ;;
      esac
  done

# Environnement de développement LEMP sous DOCKER

## déploiement en local
- mkdir digital-jobs-api
- cd digital-jobs-api
- git clone  .
- mkdir app
- mkdir database
- docker-compose build
- docker-compose up -d
- cd app/
- git clone .
- copier le fichier .env sur .env.local
- modifier le contenu du fichier .env.local
- cd ..
- docker-compose build (à l'initialisation)
- docker-compose up -d
- docker-compose exec php composer install
- docker-compose exec node npm install
- docker-compose exec node npm run watch

## accèder au site
- se connecter sur http://localhost:[port_container_NGINX]

## exécuter les commandes sur les sources
- uniquement possible lorsque l'environnement DOCKER est lancé
- docker-compose exec [nom_du_container] [commande à exécuter sur les sources]
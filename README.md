# Environnement de développement LEMP sous DOCKER

## Préalable au déploiement en local
- Pour Windows installer la commande make (https://winstall.app/apps/GnuWin32.Make ou http://gnuwin32.sourceforge.net/packages/make.htm?ref=winstall)
- Pensez à ajouter cette application dans le path des variables d’environment ("C:\Program Files (x86)\GnuWin32\bin")

## Déploiement en local
- mkdir digital-jobs-api
- cd digital-jobs-api
- git clone --branch dev git@github.com:epsi-poin-2022/api-docker.git .
- copier le fichier .env.bak sur .env (et renseigner les variables)
- mkdir app
- cd app/
- git clone git@github.com:epsi-poin-2022/api.git .
- copier le fichier .env sur .env.local (et renseigner les variables)
- cd ..
- mkdir database
- make build
- make up
- make vendor
- make node_modules
- make reset-database
- make fixtures
- make watch

## Accéder à l’api
- http://localhost/api (avec le port par défaut)

## Accéder à l’admin
- http://localhost/app/login (avec le port par défaut)

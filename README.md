# Environnement de développement LEMP sous DOCKER

## préalable au déploiement en local
- Pour Windows installer la commande make (https://winstall.app/apps/GnuWin32.Make ou http://gnuwin32.sourceforge.net/packages/make.htm?ref=winstall)
- Pensez à ajouter cette application dans le path des variables d’environment ("C:\Program Files (x86)\GnuWin32\bin")

## déploiement en local
- mkdir digital-jobs-api
- cd digital-jobs-api
- git clone --branch dev git@github.com:epsi-poin-2022/api-docker.git .
- copier le fichier .env.bak sur .env
- mkdir app
- cd app/
- git clone git@github.com:epsi-poin-2022/api-app.git .
- copier le fichier .env sur .env.local
- cd ..
- mkdir database
- make build
- make up
- make vendor
- make reset-database
- make fixtures

## accèder à l’api
- http://localhost/api (avec le port par défaut)

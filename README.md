# Dolibarr + MariaDB

- Je build mon image Dolibarr :
docker build -t dolibarr .

- Je run mon docker Dolibarr :
docker run -it -d --name doli -p80:80 dolibarr:latest 

- Je tag mon build pour le push dans le registry docker hub :
docker build -t devopsup/dolibarr:faurecia .

- la connexion au registry :
docker login --username=devopsup

- le push dans registry : 
docker push devopsup/dolibarr:faurecia


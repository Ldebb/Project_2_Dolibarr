This is a simple project to deploy a web application + database (Dolibarr + MariaDB) through a Docker:

I- Buid docker image for Dolibarr :
connad: docker build -t dolibarr .

II- Run docker image for the Dolibarr :
docker run -it -d --name doli -p80:80 dolibarr:latest 

III- Tag my build image to push it in the registry docker hub :
docker build -t devopsup/dolibarr:faurecia .

IV- Connect to the registry hub and push the image:
docker login --username=devopsup
docker push devopsup/dolibarr:faurecia


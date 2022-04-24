# lambda-postgres-backup
Repository to create a Docker image , then applied as a Lambda , which can be used to backup a Postgres database.

Steps to use:
- npm init -y
- npm install aws-lambda-ric
- docker build -t TAG .
- docker push REPO
- Deploy Lambda or Update to use image 

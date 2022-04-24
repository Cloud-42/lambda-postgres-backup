# lambda-postgres-backup
Repository to create a Docker image , then applied as a Lambda , which can be used to backup a Postgres database.

### Steps to use:
- npm init -y
- npm install aws-lambda-ric
- docker build -t TAG .
- docker push REPO
- deploy Lambda or Update to use image 

### backup.sh
- Docker image runs backup.sh to create a Postgres backup and upload it to s3. 
- backup.sh looks up SSM parameters with a PREFIX.
- Values after PREFIX- become environment variables 




### Required SSM parameters:



### Required IAM permissions:
- Read SSM parameters
- Upload to s3 bucket 

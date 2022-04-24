## Backing up a Postgres database using Lambda. 

Repository to create a Docker image , applied as a Lambda , which can be used to backup a Postgres database. Either on-demand or on a schedule. 

### Steps to use:
- npm init -y
- npm install aws-lambda-ric
- docker build -t TAG .
- docker push REPO
- deploy Lambda or Update to use image 

### backup.sh
- Docker image runs backup.sh to create a Postgres backup and upload it to s3. 
- [wrapper script](https://github.com/Cloud-42/lambda-postgres-backup/blob/main/app.js#L8) instantiates backup.sh as a child process.
- backup is created on [/tmp](https://aws.amazon.com/blogs/aws/aws-lambda-now-supports-up-to-10-gb-ephemeral-storage/). 
- backup.sh looks up SSM parameters with a PREFIX.
- Values after PREFIX- become environment variables. 
- shell script connects to the database , creates a backup and uploads to s3.

### Required SSM parameters:
- PREFIX-SourceDBUser
- PREFIX-SourceDBHost
- PREFIX-SourceDBName
- PREFIX-SourceDBPassword
- PREFIX-SourceDBPort
- PREFIX-Destinations3Bucket

### Required IAM permissions:
- Read SSM parameters
- Upload to s3 bucket 

### Limitations
- [/tmp](https://aws.amazon.com/blogs/aws/aws-lambda-now-supports-up-to-10-gb-ephemeral-storage/) has a maximum size of 10GBs.
- Lambdas can only run for 15 minutes maximum.
- [eu-west-2](https://github.com/Cloud-42/lambda-postgres-backup/blob/main/backup.sh#L6) used. Easily changed.

#!/bin/bash

set -ex

for i in `aws ssm describe-parameters --region eu-west-2  | grep Name | grep $$ PREFIX $$- | awk '{print $2}' | cut -d\" -f2` ; do
  export `echo ${i} | cut -d\- -f4`="`aws ssm get-parameter --name ${i} --region eu-west-2 --with-decryption | jq -r '.Parameter.Value'`";
done

env

FILENAME="stg"

echo "${FILENAME}.gz"

# Dump only the data and the schema (data definitions).
pg_dump --dbname=postgresql://${SourceDBUser}:${SourceDBPassword}@${SourceDBHost}:${SourceDBport}/${SourceDBName} --no-owner > "/tmp/${FILENAME}.dump"

if [ $? -eq 0 ]; then
  ls -la /tmp
  aws s3 mv /tmp/${FILENAME}.dump s3://prd-db-sync/
  exit 0
else
  exit 1
fi
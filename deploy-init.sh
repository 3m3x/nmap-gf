#!/bin/bash

# First create the project
gcloud projects create nmap-gf

# Grab the first billing account and link it to the project
BILLING_ACCOUNT_ID=$(gcloud alpha billing accounts list|grep -v ACCOUNT|awk '{print $1}')
gcloud alpha billing projects link nmap-gf --billing-account $BILLING_ACCOUNT_ID

# Now we're safe to make the bucket
GUID=$(python -c 'import uuid; print(uuid.uuid1())')
BUCKET_NAME="gs://$GUID-nmap-gf"
echo $BUCKET_NAME > .bucket-name
gsutil mb -p nmap-gf $BUCKET_NAME

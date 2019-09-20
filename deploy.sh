#!/bin/bash

echo "Zipping up files.."
zip -q nmap.zip main.py nmap* -r nse* -r scripts strace
echo "Done."

BUCKET_NAME="$(cat .bucket-name)"
gsutil cp nmap.zip $BUCKET_NAME

gcloud functions deploy nmap --runtime python37 --trigger-http --project nmap-gf
--source="$BUCKET_NAME/nmap.zip"

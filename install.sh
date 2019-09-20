#!/bin/bash

echo "Zipping up files.."
zip -q nmap.zip main.py nmap* -r nse* -r scripts strace
echo "Done."

# You'll need to create a bucket named 'nmap-gcp' first
gsutil cp nmap.zip  gs://nmap-gf/

gcloud functions deploy nmap --runtime python37 --trigger-http --source=gs://nmap-gf/nmap.zip

#!/usr/bin/env bash
set -e

if [ -z "${GOOGLE_CLOUD_PROJECT}" ]; then
  echo "Missing GOOGLE_CLOUD_PROJECT!"
  exit 1
fi

ZONE="europe-north1-a"

SERVICE_ACCOUNT="vault-server@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"

gcloud container clusters create vault \
  --enable-autorepair \
  --cluster-version 1.10.6-gke.2 \
  --enable-cloud-logging \
  --enable-cloud-monitoring \
  --machine-type n1-standard-2 \
  --num-nodes 3 \
  --service-account "${SERVICE_ACCOUNT}" \
  --zone "${ZONE}"
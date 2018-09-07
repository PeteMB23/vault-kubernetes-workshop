#!/usr/bin/env bash
set -e

if [ -z "${GOOGLE_CLOUD_PROJECT}" ]; then
  echo "Missing GOOGLE_CLOUD_PROJECT!"
  exit 1
fi

ZONE="europe-north1-b"

# Create a cluster with alpha features so we can do process namespace sharing
gcloud container clusters create my-apps \
  --cluster-version 1.10.2-gke.3 \
  --enable-cloud-logging \
  --enable-cloud-monitoring \
  --machine-type n1-standard-2 \
  --enable-kubernetes-alpha \
  --num-nodes 3 \
  --scopes "cloud-platform" \
  --zone "${ZONE}"

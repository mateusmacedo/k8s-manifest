#!/bin/bash

# Define the name of the ServiceAccount and the namespace
SA_NAME="mysql"
NAMESPACE="default"

# Retrieve the secret name that contains the token
SECRET_NAME=$(kubectl get sa $SA_NAME -n $NAMESPACE -o json | jq -r '.secrets[].name')

# Retrieve the token from the secret
TOKEN=$(kubectl get secret $SECRET_NAME -n $NAMESPACE -o json | jq -r '.data["token"]' | base64 --decode)

# Print the decoded token
echo $TOKEN

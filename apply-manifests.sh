#!/bin/bash

directory=$1

if [ -z "$directory" ]; then
  echo "Error: No directory specified."
  exit 1
fi

for filename in $(find $directory -name "*.yaml"); do
  echo "Applying manifest: $filename"
  kubectl apply -f $filename
done

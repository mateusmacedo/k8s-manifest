#!/bin/bash

directory="../mysql/templates"

for filename in $(find $directory -name "*.yaml"); do
  echo "Applying manifest: $filename"
  kubectl apply -f $filename
done

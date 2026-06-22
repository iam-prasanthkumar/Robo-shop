#!/bin/bash
 
 
# List of images to push
IMAGES=(
"cart:v1"      
"catalogue:v1"     
"frontend:v1"   
"mongo:v1"       
"mysql:v1"       
"payment:v1"          
"shipping:v1"        
"user:v1"
)
 
# Push each image
for image in "${IMAGES[@]}"; do
  echo "Pushing $image ..."
  docker push "$image"
  echo "Done: $image"
done
 
echo "All images pushed!"
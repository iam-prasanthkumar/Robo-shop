#!/bin/bash
 
 
# List of images to push
IMAGES=(
"prasanthkumar30/cart:v1"      
"prasanthkumar30/catalogue:v1"     
"prasanthkumar30/frontend:v1"   
"prasanthkumar30/mongo:v1"       
"prasanthkumar30/mysql:v1"       
"prasanthkumar30/payment:v1"          
"prasanthkumar30/shipping:v1"        
"prasanthkumar30/user:v1"
)
 
# Push each image
for image in "${IMAGES[@]}"; do
  echo "Pushing $image ..."
  docker push "$image"
  echo "Done: $image"
done
 
echo "All images pushed!"
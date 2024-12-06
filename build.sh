#!/bin/bash

# Go to the devops-build directory (the one where package.json is)
 echo "Installing dependencies..."
 npm install

 echo "Building the React app..."
 npm run build

 echo "Build completed."


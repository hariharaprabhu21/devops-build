#!/bin/bash

# Enable debugging to see each command executed
set -x

echo "Starting deployment..."

# Get the current branch name
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
echo "Deploying branch: $BRANCH_NAME"

# Check the branch and deploy accordingly
if [ "$BRANCH_NAME" == "dev" ]; then
    echo "Deploying to DEV environment..."
    docker pull hariharaprabhu21/react-app:latest
    if [ $? -ne 0 ]; then
        echo "Error: Failed to pull Docker image for DEV. Exiting."
        exit 1
    fi
    docker run -d -p 8080:80 hariharaprabhu21/react-app:latest
    if [ $? -ne 0 ]; then
        echo "Error: Failed to start container for DEV. Exiting."
        exit 1
    fi
    echo "Deployment completed for DEV. App is running on port 8080."

elif [ "$BRANCH_NAME" == "master" ]; then
    echo "Deploying to PROD environment..."
    docker pull hariharaprabhu21/react-app:latest
    if [ $? -ne 0 ]; then
        echo "Error: Failed to pull Docker image for PROD. Exiting."
        exit 1
    fi
    docker run -d -p 8080:80 hariharaprabhu21/react-app:latest
    if [ $? -ne 0 ]; then
        echo "Error: Failed to start container for PROD. Exiting."
        exit 1
    fi
    echo "Deployment completed for PROD. App is running on port 8080."

else
    echo "Unsupported branch: $BRANCH_NAME. Exiting."
    exit 1
fi




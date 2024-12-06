pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'hariharaprabhu21/react-app:latest'
        DOCKER_REGISTRY = 'docker.io'
        BRANCH_NAME = ''
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from GitHub
                    checkout scm
                    // Get the current branch name
                    BRANCH_NAME = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                    echo "Checked out branch: ${BRANCH_NAME}"
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    echo "Building Docker image for branch ${BRANCH_NAME}..."
                    // Ensure you are in the correct directory where the Dockerfile exists
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh 'docker push ${DOCKER_IMAGE}'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying the application..."
                    // Run the deploy.sh script
                    sh './deploy.sh'
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up Docker images..."
            // Clean up Docker images after the pipeline
            sh 'docker rmi ${DOCKER_IMAGE} || true'
        }
    }
}






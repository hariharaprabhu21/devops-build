pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                sh './build.sh' // Assuming build.sh handles building
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh './deploy.sh' // Replace this with your actual test command
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh './deploy.sh' // Assuming deploy.sh handles deployment
            }
        }
    }
}


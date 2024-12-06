pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        echo 'Building for DEV branch'
                        sh './build.sh'
                    } else if (env.BRANCH_NAME == 'master') {
                        echo 'Building for MASTER branch'
                        sh './build.sh'
                    }
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        echo 'Pushing to DEV Docker Hub repository'
                        sh 'docker push <DockerHubUser>/dev'
                    } else if (env.BRANCH_NAME == 'master') {
                        echo 'Pushing to PROD Docker Hub repository'
                        sh 'docker push <DockerHubUser>/prod'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        echo 'Deploying PROD environment'
                        sh './deploy.sh'
                    } else {
                        echo 'Skipping deployment for DEV branch'
                    }
                }
            }
        }
    }
}



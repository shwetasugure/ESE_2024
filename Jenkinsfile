
pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "shweta333/my-app:latest" // Replace with your Docker Hub repository name
        DOCKER_CREDENTIALS_ID = "dockerhub-creds"         // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/shwetasugure/ESE_2024.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean workspace after build
        }
    }
}
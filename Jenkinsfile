pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'shweta333/devops-poe'
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/shwetasugure/ESE_2024.git', branch: 'main'
            }
        }

        stage('Build Java Application') {
            steps {
                dir('devops-poe') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t shweta333/ESE_2024:latest -f devops-poe/Dockerfile ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'shweta333', passwordVariable: 'Sugure@4488')]) {
                        sh "echo Sugure@4488 | docker login -u shweta333 --password-stdin"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker push shweta333/devops-poe:latest"
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker rmi shweta333/devops-poe:latest || true'
            }
        }
    }
}
pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')   // ID from Jenkins credentials
        IMAGE_NAME = "mohamed0s/my-docker-app"             // Replace with your Docker Hub repo
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
            }
        }
        stage('Tag Docker Image') {
            steps {
                sh 'docker tag $IMAGE_NAME:$BUILD_NUMBER $IMAGE_NAME:$JOB_NAME-$BUILD_NUMBER'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        sh 'docker push $IMAGE_NAME:$JOB_NAME-$BUILD_NUMBER'
                    }
                }
            }
        }
    }
}

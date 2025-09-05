pipeline {
    agent any
    environment {
        IMAGE_NAME = "mohamedosa/my-docker-app"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    def safeJobName = JOB_NAME.replaceAll('\\s','-')
                    sh "docker tag $IMAGE_NAME:$BUILD_NUMBER $IMAGE_NAME:${safeJobName}-$BUILD_NUMBER"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    def safeJobName = JOB_NAME.replaceAll('\\s','-')
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        docker.image("$IMAGE_NAME:${safeJobName}-$BUILD_NUMBER").push()
                    }
                }
            }
        }
    }
}

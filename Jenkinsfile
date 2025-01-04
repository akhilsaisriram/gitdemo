pipeline {
    agent any

    environment {
        // Define the Docker image you want to use for building and deploying
        DOCKER_IMAGE = 'newto'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Install') {
            steps {
                script {
                    // Install dependencies, if any
                    echo 'Installing dependencies...'
                    sh 'docker --version' // Verify Docker installation
                }
            }
        }

     stage('Stop All Containers') {
            steps {
                script {
                    echo 'Stopping all running containers...'
                    // Stop all running containers if any
                    def containers = sh(script: 'docker ps -q', returnStdout: true).trim()
                    if (containers) {
                        sh "docker stop ${containers}"
                        echo "Stopped containers: ${containers}"
                    } else {
                        echo "No running containers found."
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    echo 'Building the Docker image...'
                    // Build the Docker image from Dockerfile
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_IMAGE_TAG .'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying the Docker image...'
                    // Run the Docker container
                    sh 'docker run -d -p 80:5000 $DOCKER_IMAGE:$DOCKER_IMAGE_TAG'
                }
            }
        }
    }
}

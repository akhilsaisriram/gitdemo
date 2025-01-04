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
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y docker.io'
                    sh 'sudo systemctl enable docker'
                    sh 'sudo systemctl start docker'
                    sh 'docker --version' // Verify Docker installation
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

    post {
        always {
            echo 'Cleaning up...'
            // You can add any cleanup steps here, e.g., stopping Docker containers
            sh 'docker ps -q | xargs docker stop'
            sh 'docker system prune -f' // Clean up unused Docker resources
        }
    }
}

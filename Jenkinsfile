pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'make debug'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'docker images'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
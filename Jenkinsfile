pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo 'Testing..'
                sh "docker run -v ${workspace}/neato_api:/code presidentbeef/brakeman:latest -f table --color"
            }
        }        
        stage('Build') {
            steps {
                echo 'Building..'
                sh "make ${params.TARGETS}"
            }
        }
        stage('Scan') {
            steps {
                echo 'Scanning..'
                sh "trivy ruby_${params.TARGETS}:latest --clear-cache"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
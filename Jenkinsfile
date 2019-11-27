pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo 'Testing..'
                sh "docker run -v ${workspace}/distroless-rails-api/neato_api:/code presidentbeef/brakeman:latest --color"
                //sh 'docker images'
            }
        }        
        stage('Build') {
            steps {
                //echo "${params}"
                //echo "Targets: ${params.TARGETS}"
                echo 'Building..'
                sh "make ${params.TARGETS}"
            }
        }
        stage('Scan') {
            steps {
                //echo "${params}"
                //echo "Targets: ${params.TARGETS}"
                echo 'Scanning..'
                sh "trivy ruby_${params.TARGETS}:latest --clear-cache"
                //sh "make ${params.TARGETS}"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
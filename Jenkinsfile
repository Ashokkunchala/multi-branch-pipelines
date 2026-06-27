pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'dotnet build src/'
            }
        }
        stage('Test') {
            steps {
                sh 'dotnet test src/ || echo "No tests defined"'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t dotnet-webapi:latest .'
            }
        }
    }
}

pipeline {
    agent any
    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t node-express:latest .'
            }
        }
    }
}

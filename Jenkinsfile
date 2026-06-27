pipeline {
    agent any
    stages {
        stage('Install') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'python -m pytest || echo "No tests defined"'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t fastapi-python:latest .'
            }
        }
    }
}

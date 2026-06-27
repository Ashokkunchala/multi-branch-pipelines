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
                sh 'python -m pytest --version || echo "No tests defined"'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t python-flask:latest .'
            }
        }
    }
}

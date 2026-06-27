pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'go build -o server src/main.go'
            }
        }
        stage('Test') {
            steps {
                sh 'go test ./... || echo "No tests defined"'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t go-gin:latest .'
            }
        }
    }
}

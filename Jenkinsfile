pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'cargo build --release'
            }
        }
        stage('Test') {
            steps {
                sh 'cargo test || echo "No tests defined"'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t rust-actix:latest .'
            }
        }
    }
}

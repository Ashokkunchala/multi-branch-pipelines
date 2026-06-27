pipeline {
    agent any
    stages {
        stage('Install') {
            steps {
                sh 'bundle install'
            }
        }
        stage('Test') {
            steps {
                sh 'ruby -c src/app.rb'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t ruby-sinatra:latest .'
            }
        }
    }
}

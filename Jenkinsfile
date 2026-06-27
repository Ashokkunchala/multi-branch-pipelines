pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'php -l src/index.php'
            }
        }
        stage('Test') {
            steps {
                sh 'php -r "echo \"PHP OK\n\";"'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t php-laravel:latest .'
            }
        }
    }
}

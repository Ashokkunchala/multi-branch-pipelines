pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '20'))
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mkdir -p build && javac -d build src/main/java/com/example/App.java'
            }
        }

        stage('Test') {
            steps {
                sh 'java -cp build com.example.App'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build --pull -t java-service:${BUILD_NUMBER} .'
            }
        }
    }

    post {
        always {
            echo "Build ${env.BUILD_TAG} finished with status ${currentBuild.currentResult}"
        }
        cleanup {
            deleteDir()
        }
    }
}
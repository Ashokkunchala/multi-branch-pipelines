pipeline {
  agent any
  options {
    timestamps()
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Build') { steps { sh 'mvn -B clean package -DskipTests' } }
        stage('Test') { steps { sh 'mvn -B test' } }
        stage('Docker Build') { steps { sh 'docker build --pull -t java-spring:${BUILD_NUMBER} .' } }
  }
  post {
    always { echo 'Multibranch build completed' }
    cleanup { deleteDir() }
  }
}

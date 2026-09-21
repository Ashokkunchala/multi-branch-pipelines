pipeline {
  agent any
  options {
    timestamps()
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Build') { steps { sh 'npm ci' } }
        stage('Test') { steps { sh 'npm run build && npm test' } }
        stage('Docker Build') { steps { sh 'docker build --pull -t typescript-express:${BUILD_NUMBER} .' } }
  }
  post {
    always { echo 'Multibranch build completed' }
    cleanup { deleteDir() }
  }
}

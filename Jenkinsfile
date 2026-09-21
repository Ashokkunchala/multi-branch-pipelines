pipeline {
  agent any
  options {
    timestamps()
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Install') { steps { sh 'python3 -m venv .venv && . .venv/bin/activate && python -m pip install --upgrade pip && pip install -r requirements.txt' } }
        stage('Test') { steps { sh '. .venv/bin/activate && python -m pytest' } }
        stage('Docker Build') { steps { sh 'docker build --pull -t fastapi-python:${BUILD_NUMBER} .' } }
  }
  post {
    always { echo 'Multibranch build completed' }
    cleanup { deleteDir() }
  }
}

pipeline {
  agent any
  options {
    timestamps()
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Build') { steps { sh 'bundle config set path .bundle/vendor && bundle install --jobs 4 --retry 3' } }
        stage('Test') { steps { sh 'ruby -c src/app.rb' } }
        stage('Docker Build') { steps { sh 'docker build --pull -t ruby-sinatra:${BUILD_NUMBER} .' } }
  }
  post {
    always { echo 'Multibranch build completed' }
    cleanup { deleteDir() }
  }
}

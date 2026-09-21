pipeline {
  agent any
  options {
    timestamps()
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Lint') { steps { sh 'php -l src/index.php' } }
    stage('Test') { steps { sh 'php -r \'echo "PHP OK\\n";\'' } }
    stage('Docker Build') { steps { sh 'docker build --pull -t php-laravel:${BUILD_NUMBER} .' } }
  }
  post {
    always { echo 'Multibranch build completed' }
    cleanup { deleteDir() }
  }
}

pipeline {
  agent any
  options {
    timestamps()
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Build') { steps { sh 'dotnet restore src/dotnet-webapi.csproj && dotnet build src/dotnet-webapi.csproj --no-restore --configuration Release' } }
        stage('Test') { steps { sh 'dotnet test src/dotnet-webapi.csproj --no-build --configuration Release' } }
        stage('Docker Build') { steps { sh 'docker build --pull -t dotnet-webapi:${BUILD_NUMBER} .' } }
  }
  post {
    always { echo 'Multibranch build completed' }
    cleanup { deleteDir() }
  }
}

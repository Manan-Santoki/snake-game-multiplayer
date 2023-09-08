#!groovy

pipeline {
  agent any
  environment {

    registry = "raptor1702/snake-game"
    registryCredential = 'dockerhub'
  }

  stages {
    stage('Get Source'){
        steps{
            checkout scm
        }
    }
    stage('Docker Build') {
      agent any
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Push Image') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }

  }
}
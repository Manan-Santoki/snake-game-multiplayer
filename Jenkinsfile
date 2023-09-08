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
    stage('Push Image') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
    stage("Deploy") {
            steps {
                sh('chmod 777 deploy.sh ')
                sh('./deploy.sh')
	          }
    }


  }
}

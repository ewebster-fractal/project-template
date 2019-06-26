pipeline {
  agent {
    docker {
      image 'python:3.5.1'
    }

  }
  stages {
    stage('get python version') {
      steps {
        sh 'python --version'
      }
    }
    stage('error') {
      steps {
        emailext(subject: 'Jenkins Job', attachLog: true, from: 'noreply@jenkins.nealanalytics.com', to: 'edwin@nealanalytics.com', body: 'See attached log')
      }
    }
  }
}
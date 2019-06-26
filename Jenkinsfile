pipeline {
  agent any
  stages {
    stage('get python version') {
      steps {
        sh 'python --version'
      }
    }
    stage('') {
      steps {
        emailext(subject: 'Jenkins Job', attachLog: true, from: 'noreply@jenkins.nealanalytics.com', to: 'edwin@nealanalytics.com', body: 'See attached log')
      }
    }
  }
}
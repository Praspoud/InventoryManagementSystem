pipeline {

  agent any

  stages {
    stage('Checkout') {
      steps {
	checkout scm
      }
    }

    stage('Docker') {
      steps {
	sh '''
	  cd /var/lib/jenkins/workspace/Back-End
	  docker build -t inventorymanagementsystem .
	  docker run -d -p 4000:8080 --name inventorymanagementsystem inventorymanagementsystem
	  docker image prune -f
	'''
	}
}
}
}

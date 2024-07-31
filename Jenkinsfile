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
	  docker build -t InventoryManagementSystem .
	  docker run -d -p 4000:80 --name InventoryManagementSystem InventoryManagementSystem
	  docker image prune -f
	'''
	}
}
}
}

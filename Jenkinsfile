
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
            git branch: 'main', credentialsId: '34b3cc00-d1e9-4d72-9172-599c899b28e1', url: 'https://github.com/shanumuru/terratest'

          }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }
        
        stage ("terraform destroy ") {
            steps {
          
                sh ('terraform destroy --auto-approve') 
           }
        }
    }
}
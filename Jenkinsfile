
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
        
       /* stage ("terraform destroy ") {
            steps {
          
                sh ('terraform destroy --auto-approve') 
           }
        }*/

         stage ("wait for user input:apply or destroy")
        {
            steps{
                    script {
            // Define Variable
             def USER_INPUT = input(
                    message: 'User input required - apply or destroy action',
                    parameters: [
                            [$class: 'ChoiceParameterDefinition',
                             choices: ['apply','destroy'].join('\n'),
                             name: 'input',
                             description: 'Menu - select action']
                    ])

            echo "The answer is: ${USER_INPUT}"

                         if( "${USER_INPUT}" == "apply"){
                             sh ('terraform apply --auto-approve') 
                          }
                           else if("${USER_INPUT}" == "destroy") {
                                   sh ('terraform destroy --auto-approve') 
                                   }
                         else {
                               echo "wrong input"
                          } //if loop ends
                
                    }
            } //steps end
        } //stage ends    

    }
}
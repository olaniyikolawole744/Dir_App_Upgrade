pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('PRIVATE_KEY')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
        DOCKERKEY = credentials ('DOCKER_KEY')
    }

    stages {
        stage('CONVERT INFRASTRUCTURE FILE TO EXECUTABLE') {
            steps {
                sh 'ls'
                sh 'chmod -x script.sh'  
                
            }
        }

        stage('BUILD INFRASTRUCTURE') {
            steps {
                sh 'sh script.sh'
           }
        } 

        stage('PLAY ANSIBLE BOOK') {
            steps {
                sh 'echo "task completed"'            
                }
        }  
    }
}
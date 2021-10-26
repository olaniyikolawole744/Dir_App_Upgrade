pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('PRIVATE_KEY')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
        DOCKERHUBKEY = credentials ('DOCKERHUB_KEY')
    }

    stages {
        
        stage('PLAY ANSIBLE BOOK') {
             when {
                branch "develop"
            }
            steps {
                sh 'sh dev_playbook.sh'      
                }
        }  

        
    }
}
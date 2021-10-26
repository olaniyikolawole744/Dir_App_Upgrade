pipeline {
    agent any

    environment {
       
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
        DOCKERHUBKEY = credentials ('DOCKERHUB_KEY')
    }

    stages {
        
        stage('PLAY ANSIBLE BOOK') {
             
            steps {
                sh 'sh dev_playbook.sh'      
                }
        }  
        
    }
}
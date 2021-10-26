pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('PRIVATE_KEY')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
        DOCKERHUBKEY = credentials ('DOCKERHUB_KEY')
    }

    stages {
        stage('BUILD AMIs') {
            steps {
                sh 'ls'
                sh 'cd scripts'
                sh 'sh packer_script.sh'
            }
        }

        stage('BUILD INFRASTRUCTURE') {
            steps {
                cd 
                sh 'sh ansible-vault decrypt packer-jobs/master-ami/tf-packer --vault-password-file $ANSIBLE_VAULT_PASSWORD_FILE'
                sh 'sh terraform_script.sh'
           }
        } 

        stage('PLAY ANSIBLE BOOK') {
             when {
                branch "develop"
            }
            steps {
                sh 'sh dev_playbook.sh'      
                }
        }  

        stage('PLAY ANSIBLE BOOK') {
             when {
                branch "master"
            }
            steps {
                sh 'sh prod_playbook.sh'      
            }
        } 
    }
}
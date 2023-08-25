pipeline {
    agent { node { label 'master' } }
    stages {
        stage('feature') {
            when {
                branch 'feature/*'
            }
            steps {
                echo 'feature'
                sh '''
                    cd terraform
                    terraform init -reconfigure -backend-config ./envs/dev/dev.application.hcl
                    terraform validate -var-file="./envs/dev/dev.tfvars" -no-color
                '''
            }
        }
        stage('PR') {
            when {
                branch 'PR-*'
            }
            steps {
                echo 'PR'
                sh '''
                    cd terraform
                    terraform init -reconfigure -backend-config ./envs/dev/dev.application.hcl
                    terraform plan -var-file="./envs/dev/dev.tfvars" -no-color
                '''
            }
        }
        stage('main') {
            when {
                branch 'refs/remotes/origin/main'
            }
            steps {
                echo 'main'
                sh '''
                    cd terraform
                    terraform init -reconfigure -backend-config ./envs/dev/dev.application.hcl
                    terraform apply -var-file="./envs/dev/dev.tfvars" -no-color -auto-approve
                '''
            }
        }
    }
}

pipeline {
    agent { node { label 'master' } }
    stages {
        // stage('tf plan') {
        //     steps {
        //         sh '''
        //             cd terraform
        //             terraform init -reconfigure -backend-config ./envs/dev/dev.application.hcl
        //             terraform plan -var-file="./envs/dev/dev.tfvars" -no-color
        //         '''
        //     }
        // }
        stage('main') {
            when {
                branch 'main'
            }
            steps {
                echo 'main'
            }
        }
        stage('other') {
            when {
                expression {
                    return env.BRANCH_NAME != 'main';
                }
            }
            steps {
                echo 'other'
            }
        }
        stage('PR') {
            when {
                expression {
                    branch 'PR*'
                }
            }
            steps {
                echo 'PR'
            }
        }
        // stage('tg plan') {
        //     steps {
        //         script {
        //             if (env.BRANCH_NAME == 'main') {
        //                 echo 'main'
        //             } else if (env.BRANCH_NAME.startsWith('PR')) {
        //                 echo 'pr'
        //             } else {
        //                 echo 'other'
        //             }
        //         }

        //         // sh '''
        //         //     cd terragrunt/envs/prod
        //         //     terragrunt init -reconfigure -backend-config ./envs/prod/prod.application.hcl
        //         //     terragrunt plan -no-color
        //         // '''
        //     }
        // }
    }
}

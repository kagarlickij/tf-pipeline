// node
// {
//     stage ('clean') {
//         cleanWs()
//     }
//     // stage ('checkout') {
//     //     git url: 'https://github.com/kagarlickij/tf-pipeline.git'
//     // }
//     stage ('build') {
//         sh '''
//             ls -lAp .
//         '''
//     }
// }

pipeline {
    agent { node { label 'master' } }
    stages {
        stage('plan') {
            steps {
                sh '''
                    cd terraform
                    terraform init -reconfigure -backend-config ./envs/dev/dev.application.hcl
                    terraform plan -var-file="./envs/dev/dev.tfvars" -no-color
                '''
            }
        }
    }
}

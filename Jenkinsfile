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
        stage('ls') {
            steps {
                sh '''
                    ls -lAp .
                '''
            }
        }
    }
}

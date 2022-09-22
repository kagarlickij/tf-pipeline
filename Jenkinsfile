node
{
    stage ('clean') {
        cleanWs()
    }
    stage ('checkout') {
        git url: 'https://github.com/kagarlickij/tf-pipeline.git'
    }
    stage ('build') {
        sh '''
            ls -lAp .
        '''
    }
}

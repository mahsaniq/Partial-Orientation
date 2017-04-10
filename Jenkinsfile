pipeline {
    agent { docker 'ruby'}
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello World"'
                sh '''
                   echo "Multiline shell steps works too"
                   ls -lah
                '''
                sh 'ruby --version'
            }
        }
    }
}

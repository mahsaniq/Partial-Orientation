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
        stage(‘Deploy’) {
            steps {
                retry(3) {
                    sh ‘./flake-deploy.sh’
                }

                timeout(time: 3, unit: ‘MINUTES’) {
                    sh ‘./health-check.sh’
                }
            }
        }
    }
}

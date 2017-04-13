pipeline {
    agent { docker 'ruby'}
    stages {
        stage('Build') {
            steps {
                sh 'echo “Building”’
                sh '''
                   echo "Multiline shell steps works too"
                   ls -lah
                '''
                sh 'ruby --version'
            }
        }
        stage(‘Deploy - Staging’) {
            steps {
                sh ‘echo “Deploying on Staging”’
                retry(3) {
                    /* sh ‘./flakey-deploy.sh’ */
                    sh ‘./deploy staging’
                    sh ‘./run-smoke-tests’
                }
                timeout(time: 3, unit: ‘MINUTES’) {
                    sh ‘./health-check.sh’
                }
            }
        }
        stage('Sanity check') {
            steps {
                input "Does the staging environment look ok?"
            }
        }
        stage(‘Deploy - Production’) {
            steps {
                sh ‘echo “Deploying on Production”’
                retry(3) {
                    /* sh ‘./flakey-deploy.sh’ */
                    sh ‘./deploy production’
                }
                timeout(time: 3, unit: ‘MINUTES’) {
                    sh ‘./health-check.sh’
                }
            }
        }
        stage('Test') {
            steps {
                sh ‘echo “Testing”’
                sh 'echo "Fail!"; exit 1'
            }
        }
        stage('No-op') {
            steps {
                sh 'ls'
            }
        }
    }
    post {
        always {
            echo ‘One way or another, I have finished’
            deleteDir() /* Clean up our workspace */
        }
        success {
            echo ‘I succeeded!’
            /*
            slackSend channel: '#ops-room',
                color: 'good',
                message: "The pipeline ${currentBuild.fullDisplayName} completed successfully."
            */
        }
        failure {
            echo ‘I failed :(‘
            /*
            mail to: 'team@example.com',
                subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                body: "Something is wrong with ${env.BUILD_URL}"
            */
        }
        unstable {
            echo ‘I am unstable :/’
        }
        changed {
            echo ‘Things were different before’
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}

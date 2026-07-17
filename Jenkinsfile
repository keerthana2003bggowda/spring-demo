pipeline {
    agent { label 'agent2' }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-pat',
                    url: 'https://github.com/keerthana2003bggowda/spring-demo.git'
            }
        }

        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh "${tool('sonar-scanner')}/bin/sonar-scanner"
                }
            }
        }

        stage('Publish to Artifactory') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'artifactory-creds',
                    usernameVariable: 'JFROG_USER',
                    passwordVariable: 'JFROG_PASS'
                )]) {
                    sh """
                        curl -u $JFROG_USER:$JFROG_PASS \
                             -T target/*.jar \
                             "http://13.201.51.61:8082/artifactory/libs-release-local/spring-demo-${BUILD_NUMBER}.jar"
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'nohup java -jar target/*.jar --server.port=9090 > app.log 2>&1 &'
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
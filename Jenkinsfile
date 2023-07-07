pipeline {
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any
    tools {
        maven 'maven_3.8.8'
    }

    stages {
        stage ('Code Compilation') {
            steps {
                echo 'Code start compiling...'
                sh 'mvn clean compile'
                echo 'Code Compilation Done'
            }
        }

        stage ('Code Packaging') {
            steps {
                echo 'Code start packaging...'
                sh 'mvn clean package -DskipTests'
                echo 'Code Packaging Done.'
            }
        }

        stage ('S3 Deploy') {
            steps {
                withAWS(credentials: 'users3', region: 'us-east-1') {
                    echo 'Uploading to S3...'
                    s3Upload(file:'/var/lib/jenkins/workspace/cafe/target/com.inn.cafe-0.0.1-SNAPSHOT.jar', bucket:'frontendandbackend', path:'backend/com.inn.cafe-0.0.1-SNAPSHOT.jar')
                    echo 'S3 upload Done.'
                }
            }
        }
    }
}

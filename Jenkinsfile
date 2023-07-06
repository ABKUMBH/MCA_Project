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
                withCredentials([string(credentialsId: 'users3', variable: 'awsCredentials')]) {
                    echo 'Uploading to S3...'
                    sh 'aws s3 cp /var/lib/jenkins/workspace/cafe\\ express/target/com.inn.cafe-0.0.1-SNAPSHOT.jar s3://frontendandbackend/com.inn.cafe-0.0.1-SNAPSHOT.jar --profile $awsCredentials'
                    echo 'S3 upload Done.'
                }
            }
        }
    }
}

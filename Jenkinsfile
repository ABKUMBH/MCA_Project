pipeline{
        options{
                buildDiscarder(logRotator(numToKeepStr:'5',
                artifactNumToKeepStr:'5'))
        }
        agent any
        tools {
        maven 'maven_3.8.8'
        }

        stages{
            stage ('code compilation'){
                steps{
                echo 'code start compiling...'
                sh 'mvn clean compile'
                echo 'Code Compilation Done '
                }
            }



            stage ('code packaging'){
                steps{
                echo 'code start packaging...'
                sh 'mvn clean package -DskipTests'
                echo 'Code packaging Done.'
                }
            }

            stage ('s3 deploy'){
                 steps{
                 withCredential(credentialId:'users3')
                 echo 'uploaing to s3'
                 sh 'aws s3  /var/lib/jenkins/workspace/cafe express/target/com.inn.cafe-0.0.1-SNAPSHOT.jar s3://frontendandbackend/com.inn.cafe-0.0.1-SNAPSHOT.jar'
                 echo 'Code packaging Done.'
                 }
            }

        }
}

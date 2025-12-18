pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
        S3_BUCKET = "sans-devops-static-site"
    }

    tools {
        maven 'maven'
    }

    stages {

        stage('Validate') {
            steps {
                sh 'ls -l src'
            }
        }

        stage('Test - SonarQube') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform -chdir=terraform/site init'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[
                  $class: 'AmazonWebServicesCredentialsBinding',
                  credentialsId: 'aws-creds'
                ]]) {
                    sh 'terraform -chdir=terraform/site apply -auto-approve'
                }
            }
        }

        stage('Deploy to S3') {
            steps {
                sh 'aws s3 sync src/ s3://$S3_BUCKET --delete'
            }
        }
    }
}

pipeline {
    agent any

    tools {
        maven 'maven-3.9'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/SanskrutiChavan/devops-static-site.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage (static site - no compile needed)'
            }
        }

        stage('Validate') {
            steps {
                sh 'ls -l src'
            }
        }

        stage('Test') {
            steps {
                echo 'SonarQube test will be added later'
            }
        }
    }
}

pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/vishalsardar/apollo_assignment.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("Sonar") {
                    sh """
                        ${tool 'SonarScanner'}/bin/sonar-scanner -Dsonar.projectName=myproject -Dsonar.projectKey=myproject  -X"""
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: false
                }
            }
        }
    }
}

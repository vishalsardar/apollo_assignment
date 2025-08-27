pipeline {
    agent any

    tools {
        nodejs "NodeJS"                  // must match your NodeJS tool name in Jenkins
        sonarQubeScanner "SonarScanner"  // must match the name you configured above
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/vishalsardar/apollo_assignment.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
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

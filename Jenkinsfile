pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sabinajangirova/cicd-pipeline.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_creds_id') {
                        def app = docker.build('sajangirova/cicd_build_image', '.')
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
    post {
        always {
            echo "Pipeline completed."
        }
    }
}

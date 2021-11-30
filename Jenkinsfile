
pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhublogin')

	}
    
	stages {

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login --username=suadakoci --password=Jennastojku12'
			}
		}
        stage('Build') {

			steps {
				sh 'docker build -t suadakoci/springboot-backend:v1 .'
			}
		}


		stage('Push') {

			steps {
				sh 'docker push suadakoci/springboot-backend:v1'
			}
		}

		stage ('Kubernetes deploy'){
			steps {
        sh ("/usr/local/bin/kubectl apply -f quiz-server.yml")
				
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}

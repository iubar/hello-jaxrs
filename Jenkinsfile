pipeline {
    agent {    
    	docker {   	
    		image 'iubar-maven-alpine'
    		label 'docker'
    		args '-v ${HOME}/.m2:/home/jenkins/.m2:rw,z -v ${HOME}/.sonar:/home/jenkins/.sonar:rw,z'
    	} 
    }
	options {
		ansiColor('xterm')
	}    
	environment {	
		MAVEN_CLI_OPTS = '--batch-mode --show-version'
	}    
    stages {
		stage ('Build') {
            steps {
                sh 'mvn $MAVEN_CLI_OPTS clean compile'
            }
        }
        stage('Analyze') {
            steps {
				script {
					try {
						sh 'sonar-scanner'
					} catch (err){
						echo "SonarQube: analyze failed !!!"
					}
				}
				sh 'mvn dependency:tree' 
            }
        }
		stage ('Deploy') {
            steps {
                sh 'mvn $MAVEN_CLI_OPTS -DskipTests=true deploy'
            }
        }         	
    }
	post {
        success {
        	sh 'mvn $MAVEN_CLI_OPTS dependency:analyze'
			sh 'mvn $MAVEN_CLI_OPTS versions:display-dependency-updates versions:display-plugin-updates'
			sh 'mvn $MAVEN_CLI_OPTS versions:display-dependency-updates'          
        }	
        changed {
        	echo "CURRENT STATUS: ${currentBuild.currentResult}"
            sh "curl -H 'JENKINS: Pipeline Hook Iubar' -i -X GET -G ${env.IUBAR_WEBHOOK_URL} -d status=${currentBuild.currentResult} -d project_name=${JOB_NAME}"
        }
		cleanup { // see https://jenkins.io/doc/book/pipeline/syntax/#declarative-pipeline
			cleanWs() // Workspace Cleanup Plugin (https://jenkins.io/doc/pipeline/steps/ws-cleanup/#cleanws-delete-workspace-when-build-is-done)
			echo "Deleting ${env.WORKSPACE}@tmp ..."
			dir("${env.WORKSPACE}@tmp") {				
				deleteDir()
			}
        }			
    }    
}
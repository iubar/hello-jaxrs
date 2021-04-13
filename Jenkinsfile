pipeline {
    agent {    
    	docker {   	
    		image 'iubar-openliberty'
    		label 'docker'
    		args '-v ${HOME}/.m2:/home/jenkins/.m2:rw,z -v ${HOME}/.sonar:/home/jenkins/.sonar:rw,z'
    	} 
    }
	options {
		ansiColor('xterm')
	}    
	environment {	
		MAVEN_CLI_OPTS = '--batch-mode --show-version'
		HOST = '127.0.0.1'
		ROUTE = 'hello-jaxrs/hello'		
	}    
    stages {
		stage ('Build') {
            steps {
                sh 'mvn $MAVEN_CLI_OPTS clean compile'
            }
        }
        stage('Analyze') {
            steps {
				// Pipeline's script step expects Groovy script, not Bash scrip
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
		// Example: curl --insecure --location --silent --show-error --output /dev/null --write-out "%{http_code}" http://${HOST}:9080/${ROUTE} | xargs echo "Response http code: "		
		stage ('Deploy2') {
            steps {
				sh '''
				ls -la /opt
				ls -la ${LIBERTY_ROOT}
				ls -la ${LIBERTY_ROOT}/usr
				ls -la ${LIBERTY_ROOT}/usr/servers
				ls -la ${LIBERTY_FOLDER}
				cp target/hello-jaxrs.war ${LIBERTY_FOLDER}/dropins/
				${LIBERTY_ROOT}/bin/server start myserver --clean				
				nc -v -z -w3 $HOST 9080
				nc -v -z -w3 $HOST 9443						
				sh ./client.sh
				'''
            }
        }
    }
	post {
        success {
        	sh 'mvn $MAVEN_CLI_OPTS dependency:analyze'
			sh 'mvn $MAVEN_CLI_OPTS versions:display-dependency-updates versions:display-plugin-updates'
			sh 'mvn $MAVEN_CLI_OPTS versions:display-dependency-updates'          
        }	
        //changed {
        	// echo "CURRENT STATUS: ${currentBuild.currentResult}"
            // sh "curl -H 'JENKINS: Pipeline Hook Iubar' -i -X GET -G ${env.IUBAR_WEBHOOK_URL} -d status=${currentBuild.currentResult} -d project_name=${JOB_NAME}"
        //}
		cleanup { // see https://jenkins.io/doc/book/pipeline/syntax/#declarative-pipeline
			cleanWs() // Workspace Cleanup Plugin (https://jenkins.io/doc/pipeline/steps/ws-cleanup/#cleanws-delete-workspace-when-build-is-done)
			echo "Deleting ${env.WORKSPACE}@tmp ..."
			dir("${env.WORKSPACE}@tmp") {				
				deleteDir()
			}
        }			
    }    
}
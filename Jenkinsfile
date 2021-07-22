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
		WAR_FILE = 'hello-jaxrs.war'
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
		stage ('Staging') {
            steps {
				sh '''
				cat server.xml
				cp target/${WAR_FILE} ${LIBERTY_FOLDER}/dropins/
				${LIBERTY_ROOT}/bin/server start myserver --clean				
				nc -v -z -w3 $HOST 9080
				nc -v -z -w3 $HOST 9443
				HTTP_CODE=$(curl --insecure --location --silent --show-error --output /dev/null --write-out "%{http_code}" http://${HOST}:9080/${ROUTE})
				if [ $HTTP_CODE = 200 ]; then
					echo "INFO: response code is $HTTP_CODE"
				else
					echo "ERROR: response code is $HTTP_CODE"
					exit 1
				fi
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
        changed {
			echo "CURRENT STATUS: ${currentBuild.currentResult}"
			sh "curl -H 'JENKINS: Pipeline Hook Iubar' -i -X GET -G ${env.IUBAR_WEBHOOK_URL} -d status=${currentBuild.currentResult} -d project_name='${JOB_NAME}'"
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
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
		ROUTE2 = 'hello-jaxrs/temp/c'
		WAR_FILE = 'hello-jaxrs.war'
	}    
    stages {
		stage ('Build') {
            steps {
                sh 'mvn $MAVEN_CLI_OPTS clean compile'
            }
        }
        stage('Quality') {
            when {
              not {
				  environment name: 'SKIP_SONARQUBE', value: 'true'
			  }  
            }
            steps {
					sh '''
	               			sonar-scanner
							wget --user=${ARTIFACTORY_USER} --password=${ARTIFACTORY_PASS} http://192.168.0.119:8082/artifactory/iubar-repo-local/jenkins/jenkins-sonar-quality-gate-check.sh --no-check-certificate
							chmod +x ./jenkins-sonar-quality-gate-check.sh
							./jenkins-sonar-quality-gate-check.sh false # true / false = Ignore or not the quality gate score
					'''
            }
        }
		stage ('Deploy') {
            steps {
                sh 'mvn $MAVEN_CLI_OPTS -DskipTests deploy'
            }
        }
		// Example: curl --insecure --location --silent --show-error --output /dev/null --write-out "%{http_code}" http://${HOST}:9080/${ROUTE} | xargs echo "Response http code: "		
		stage ('Staging') {
            steps {
				sh '''
				cat ${LIBERTY_FOLDER}/server.xml
				cp temperature.txt ${LIBERTY_FOLDER}/
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
				
				HTTP_CODE=$(curl --insecure --location --silent --show-error --output /dev/null --write-out "%{http_code}" http://${HOST}:9080/${ROUTE2})
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
        	sh 'mvn $MAVEN_CLI_OPTS dependency:tree' 
        	sh 'mvn $MAVEN_CLI_OPTS dependency:analyze'
			sh 'mvn $MAVEN_CLI_OPTS versions:display-plugin-updates'
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
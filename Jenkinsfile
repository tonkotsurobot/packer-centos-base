node {
 	// Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
        	checkout scm
        }
        stage ('Build') {
        	sh "echo 'shell scripts to build project...'"
        }
        stage ('Tests') {
	        parallel 'static': {
	            sh "echo 'shell scripts to run static tests...'"
	        },
	        'unit': {
	            sh "echo 'shell scripts to run unit tests...'"
	        },
	        'integration': {
	            sh "echo 'shell scripts to run integration tests...'"
	        }
        }
      	stage ('Deploy') {
            sh "packer build -var esxi_host=${ESXI_HOST} -var esxi_datastore=${DATASTORE} -var esxi_username=${ESXI_USER} -var esxi_password=${ESXI_PASS} packer-centos.json"
      	}
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}

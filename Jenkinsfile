#!/usr/bin/env groovy

node ('master'){
	stage('Download code') {
		git url: 'https://github.com/fmenendez/AngularPoc'
  }
    
  stage('Build, Test and Publish') {
		if (isUnix()) {
				sh "npm install"
				sh "bower install"
			  sh "grunt build"
				sh "npm test"				
				sh "docker build -t 192.168.2.15:10082/angularpoc ."
				sh "docker push 192.168.2.15:10082/angularpoc"
				sh "grunt sonar"
		}else{
				bat "npm install"
				bat "bower install"
				bat "grunt build"
				bat "npm test"				
				bat "docker build -t 192.168.2.15:10082/angularpoc ."
				bat "docker push 192.168.2.15:10082/angularpoc"
				bat "grunt sonar"
		}
  }
	
	stage('Kubernetes Deploy') {
	    def workspace = pwd()
		if (isUnix()) {
			sh "kubectl replace -f ${workspace}/Kubernetes/kubernetes.yaml --force"
		}else{
			bat "kubectl replace -f ${workspace}/Kubernetes/kubernetes.yaml --force"
		}
  }
}
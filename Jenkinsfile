imagePrefix = 'daniel1302/litecoin'
repositoryUrl = 'http://github.com/daniel1302/litecoin.git'
currentFullImage = imagePrefix
newFullImage = imagePrefix
isMaster = false
ansiColor = 'xterm'

boolean commandSuccess(String cmd) {
  cmdOut = sh script: cmd, returnStatus: true

  return cmdOut == 0
}

node {
    // Disable concurrent build, We should use
    properties([
        disableConcurrentBuilds(),
    ])

    stage('Prepare CI') {
        // Get latest version of code
        // Ref: https://www.jenkins.io/doc/pipeline/steps/git/
        git changelog: false,
          url: repositoryUrl,
          branch: 'master'
     
        isMaster = (env.BRANCH_NAME == 'master')
        currentFullImage += ':build-' + env.BUILD_NUMBER

        config = readYaml file: 'config.yml'
        newFullImage = newFullImage + ':' + config.versinon
    }

    stage('Build docker image') {
      timeout(time: 3, unit: 'MINUTES') {
        ansiColor(ansiColor) {
          sh 'docker build -t ' + currentFullImage + ' .'
        }
      }
    }

    stage('Inspect docker vulns') {
      timeout(time: 10, unit: 'MINUTES') {
        ansiColor(ansiColor) {
          sh './inline_scan scan ' + currentFullImage
        }
      }
    }

    stage("Publish docke rimage") {
      if (!isMaster) {
        return
      }

      // Fail pipeline if version already exist
      if (commandSuccess('docker pull ' + newFullImage + ' > /dev/null')) {
        error('Image already exists. Bump the version in the config.yml to publish the new one')
      }

      withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        sh 'docker login -u \'' + USERNAME + '\' -p \'' + PASSWORD + '\''
        sh 'docker tag ' + currentFullImage + ' ' + newFullImage
        sh 'docker push ' + newFullImage
      }
    }
}

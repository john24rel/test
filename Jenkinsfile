def GIT_TOKEN    = ""
def GIT_USERNAME = ""

node("ansible"){  
           withCredentials([usernamePassword(credentialsId: 'git-access', passwordVariable: 'GIT_TOKEN', usernameVariable: 'GIT_USERNAME' )]) {
            stage("john24rel repo"){
             dir("/home/jenkins/john24rel"){
              sh '''
               rm -rf /home 2> /dev/null
               mkdir -p /home/jenkins/git
               set +x
               git clone https://${GIT_USERNAME}:${GIT_TOKEN}@github.com/john24rel/checked.git
              '''
          stage("Pull Repo"){
           dir("/home/jenkins/pull"){          
           git credentialsId: 'git-access', url: 'https://github.com/john24rel/pull-all-repo.git'

           stage("script run"){
                 sh """
                      git config --global user.email "john@yahoo.com"
                      git config --global user.name "John Oshikoya"
                      bash ansible.sh 
                    """
                 ansiColor('xterm') {
                 ansiblePlaybook colorized: true, installation: 'ansible2.5.11', inventory: 'localhost', playbook: 'pull.yml'
              }
            }
          }
        }
      }
    }
  }
}
     

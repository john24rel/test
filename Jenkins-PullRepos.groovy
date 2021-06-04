node("ansible"){  
      stage("john24rel repo"){
      sh """
       mkdir /john24rel /git && cd /john24rel && git clone https://john24rel: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@github.com/john24rel/checked.git
        """
    stage("Pull Repo"){
     git credentialsId: 'git', url: 'https://github.com/john24rel/pull-all-repo.git'
     
     stage("script run"){
     sh """
          git config --global user.email "john@yahoo.com"
          git config --global user.name "John Oshikoya"
         . ansible.sh 
        """
     ansiColor('xterm') {
     ansiblePlaybook colorized: true, installation: 'ansible2.5.11', inventory: 'localhost', playbook: 'pull.yml'
        }
      }
    }
  }
}

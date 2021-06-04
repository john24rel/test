## Color codes
green=$(tput setaf 2)
red=$(tput setaf 1)
reset=$(tput sgr0)
ansible localhost -m ping
ansible-playbook -i localhost  pull.yml -b
if [ $? -eq 0 ]; then
  read -p "${red}There have been changes in ${BRANCH} branch, do you want to git pull: ${reset}" yes
  if [[ $yes == yes ]] || [[ $yes == y ]] || [[ $yes == Y ]]; then
    git pull
    echo "${green}Your local branch is up to date with remote ${BRANCH} now${reset}"
  else
    echo "${red}Skipping git pull, your local branch is not up to date with remote ${BRANCH} branch${reset}"
  fi
elif [ $? -eq 1 ]; then
  echo "${green}You branch is up to date'${reset}"
fi

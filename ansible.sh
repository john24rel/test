ansible localhost -m debug -a  var=ansible_host
ansible-playbook -i localhost -l all pull.yml 

export ANSIBLE_FORCE_COLOR=true
export BUILDVERSION = sh(script: "echo `date +%s`", returnStdout: true).trim()
ansible localhost -m ping
# export ANSIBLE_FORCE_COLOR=true
# ansible-playbook -i localhost  pull.yml -b


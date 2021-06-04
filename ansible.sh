export ANSIBLE_FORCE_COLOR=true
ansible localhost -m ping
export ANSIBLE_FORCE_COLOR=true
sudo -E ansible-playbook -i localhost  pull.yml -b


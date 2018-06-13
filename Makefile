main: syntax_check

install:
	ansible-galaxy install -f -p roles -r requirements.yml
	if [ ! -d "/tmp/ansible-retry" ]; then mkdir "/tmp/ansible-retry"; fi

playbook:
	ansible-playbook -i inventory main.yml -v --ask-become-pass

syntax_check:
	ansible-playbook --syntax-check main.yml

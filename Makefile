export VAGRANT_GIT_EMAIL=$(shell git config --get user.email)
export VAGRANT_GIT_NAME=$(shell git config --get user.name)

spinup:
	echo "192.168.50.71  fantasymtg.local" | sudo tee -a /etc/hosts
	cp ~/.ssh/id_rsa git_ssh_key
	vagrant up
	sleep 5s
	open -a "Google Chrome" http://fantasymtg.local
update:
	vagrant ssh -c "sudo sudo -u fantasymtg git -C /webapps/fantasymtg/src/fantasymtg pull"
	vagrant ssh -c "sudo sudo -u fantasymtg HOME=/home/fantasymtg /webapps/fantasymtg/bin/pip install -r /webapps/fantasymtg/src/fantasymtg/requirements.pip --upgrade"
	vagrant ssh -c "sudo sudo -u fantasymtg /webapps/fantasymtg/bin/python /webapps/fantasymtg/bin/manage.py migrate"
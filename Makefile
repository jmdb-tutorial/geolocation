# Not you will first need to upload your keys to the remote server
# https://linuxhandbook.com/add-ssh-public-key-to-server/
# ssh-copy-id -i ~/.ssh/id_rsa.pub YOUR_USER_NAME@IP_ADDRESS_OF_THE_SERVER
# https://unix.stackexchange.com/questions/36540/why-am-i-still-getting-a-password-prompt-with-ssh-with-public-key-authentication
# Make sure that on the server that the file permissions for the server .ssh directory are correct:
# chmod -R 700 ~/.ssh
#
# You need to create a file called ~/.sftpixcode containing:
# export SITE_HOSTNAME=<name of sftp host>
# export SITE_USERNAME=<name of sftp user>
#
# Not related but interesting: https://stackoverflow.com/questions/24742223/makefile-dependent-targets-based-on-current-target


include ~/.sftpixcode

#cat ~/.ssh/id_rsa.pub | ssh ${SITE_USERNAME}@${SITE_HOSTNAME} 'cat >> ~/.ssh/authorized_keys'

upload-ssh-key:
	ssh-copy-id -i ~/.ssh/id_rsa.pub ${SITE_USERNAME}@${SITE_HOSTNAME}

package:
	mkdir -p build
	cd site && tar cfvz ../build/site.tgz .
	cd ..

ssh:
	ssh ${SITE_USERNAME}@${SITE_HOSTNAME}

ssh-debug:
	ssh -v ${SITE_USERNAME}@${SITE_HOSTNAME}


publish: package
	$(info Going to sftp the files up to the server: username [${SITE_USERNAME}], hostname [${SITE_HOSTNAME}])
	scp build/site.tgz ${SITE_USERNAME}@${SITE_HOSTNAME}:~
	scp ops/upgrade-site.sh ${SITE_USERNAME}@${SITE_HOSTNAME}:~



verify:
	eslint site/js/**

watch:
	fswatch -o site/js | xargs -n1 -I{} eslint site/js/**

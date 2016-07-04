#/bin/bash

if [ -d /vagrant/provisioners/files/ansible2 ]; then
    dpkg -i /vagrant/provisioners/files/ansible2/*.deb
else
    apt-get -y -qq install software-properties-common
    apt-add-repository -y ppa:ansible/ansible 2>/dev/null 1>/dev/null
    apt-get -y -qq update
    apt-get -y -qq install ansible
fi

if [ -f /vagrant/provisioners/ansible/vagrant_development ]; then
    chmod 644 /vagrant/provisioners/ansible/vagrant_development
fi



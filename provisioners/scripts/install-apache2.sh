#/bin/bash

if [ -d /vagrant/provisioners/files/apache2 ]; then
    dpkg -i /vagrant/provisioners/files/apache2/*.deb
else
    apt-get -y -qq install apache2
fi

if [ ! -d /var/www/html/vagrant ]; then
    /bin/ln -s /vagrant /var/www/html/vagrant
fi

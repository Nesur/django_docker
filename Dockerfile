FROM httpd:2.4.41

RUN apt-get update&&apt-get install -y wget python3 python3-dev python3-distutils build-essential

WORKDIR /usr/local
# install pip and django
RUN wget https://bootstrap.pypa.io/get-pip.py&&python3 get-pip.py&&rm get-pip.py&&pip install virtualenv&&pip install django
# download and unpack mod-wsgi
RUN wget https://github.com/GrahamDumpleton/mod_wsgi/archive/4.7.1.tar.gz&&tar xvfz 4.7.1.tar.gz&&rm 4.7.1.tar.gz

WORKDIR /usr/local/mod_wsgi-4.7.1

RUN ./configure --with-python=/usr/bin/python3&&make&&make install

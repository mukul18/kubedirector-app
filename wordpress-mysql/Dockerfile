#mysql centos 7x docker image

FROM bluedata/centos7:latest

#Install mysql

RUN wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm --directory-prefix=/usr/lib/

RUN sudo -E rpm -ivh /usr/lib/mysql-community-release-el7-5.noarch.rpm

#RUN yum -y update

RUN yum -y install mysqld mysql-server

#wordpress packages

#Install php
RUN yum install -y  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y yum-utils
RUN yum-config-manager --enable remi-php56
RUN yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

RUN mkdir /opt/configscripts/
                                                                    
RUN wget http://wordpress.org/latest.tar.gz --directory-prefix=/opt/configscripts/

COPY appconfig-wp.tgz /opt/configscripts/


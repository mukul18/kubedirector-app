##############################
# http Dockerfile
################################

# Use BlueData base image 
FROM bluedata/centos7

# Install packages with silent (unattended) option
RUN yum -y install httpd

RUN mkdir /opt/configscripts/
COPY appconfig.tgz /opt/configscripts/

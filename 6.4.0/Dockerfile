# Steps taken to create this image
# docker build --rm -t beckerhsieh/jboss-eap:6.4.0 .
# docker run -p 9990:9990 -p 9999:9999 -p 8080:8080 -it beckerhsieh/jboss-eap:6.4.0
# 
# Get required ZIP file from: https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=32483&product=appplatform
#
#
FROM ubuntu:15.04
MAINTAINER beckerhsieh 
ADD files/jdk-7u79-linux-x64.tar /usr/local
ENV JAVA_HOME /usr/local/jdk1.7.0_79
ENV PATH /usr/local/jdk1.7.0_79/bin:$PATH
RUN apt-get install unzip
ADD files/jboss-eap-6.4.0.zip /tmp/
RUN unzip /tmp/jboss-eap-6.4.0.zip -d /usr/local

# Add EAP_HOME environment variable, to easily upgrade the script for different EAP versions
ENV EAP_HOME /usr/local/jboss-eap-6.4

# Add default admin user
RUN ${EAP_HOME}/bin/add-user.sh admin admin123! --silent

# Enable binding to all network interfaces and debugging inside the EAP
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> ${EAP_HOME}/bin/standalone.conf

# Add volume if you want to externalize logs
VOLUME ${EAP_HOME}/standalone/logs

EXPOSE 9990 9999 8080 8787

ENTRYPOINT ["/usr/local/jboss-eap-6.4/bin/standalone.sh"]

CMD []


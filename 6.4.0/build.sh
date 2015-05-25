#!/bin/bash

if [ ! -e files/jdk-7u79-linux-x64.tar ]
then
   echo "You should get required JDK binary before trying to build this image."
   echo "Binary is available at: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html"
   exit 255
fi

if [ ! -e files/jboss-eap-6.4.0.zip ]
then
   echo "You should get required EAP binary before trying to build this image."
   echo "Binary is available at: https://access.redhat.com/jbossnetwork/restricted/softwareDownload.html?softwareId=32483&product=appplatform"
   exit 255
fi

docker build --rm -t beckerhsieh/jboss-eap:6.4.0 .

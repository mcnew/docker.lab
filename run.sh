#!/bin/sh

LAB_WORKDIR=$(readlink -f $(dirname $0))

# -e MYSQL_ROOT_PASSWORD=asecretpwd
docker run --name=mysql -p 3306 -d -v $LAB_WORKDIR/mysql:/var/lib/mysql mysql

docker run --name=tomcat01 --link mysql:db -d -v $LAB_WORKDIR/tomcat/conf:/home/service/conf:ro -v $LAB_WORKDIR/tomcat/lib:/home/service/lib:ro -v $LAB_WORKDIR/webapps:/home/service/webapps:ro razzek/lab.tomcat:8.0.24

docker run --name=tomcat02 --link mysql:db -d -v $LAB_WORKDIR/tomcat/conf:/home/service/conf:ro -v $LAB_WORKDIR/tomcat/lib:/home/service/lib:ro -v $LAB_WORKDIR/webapps:/home/service/webapps:ro razzek/lab.tomcat:8.0.24

docker run --name=httpd --link tomcat01 --link tomcat02 -p 80 -d -v $LAB_WORKDIR/httpd/conf:/usr/local/apache2/conf httpd

docker run --name jenkins -p 8080 -d -v $LAB_WORKDIR/webapps:/home/service/webapps -v $HOME/data/scm/applab:/home/service/scm:ro -v $LAB_WORKDIR/jenkins:/home/service/.jenkins -v $LAB_WORKDIR/m2:/home/service/.m2 razzek/lab.jenkins:1.609.2

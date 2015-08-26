FROM razzek/lab.java:8

RUN curl -fSLs http://mirrors.jenkins-ci.org/war-stable/1.609.2/jenkins.war -o /opt/jenkins.war \
&& echo '59215da16f9f8a781d185dde683c05fcf11450ef /opt/jenkins.war' | sha1sum -c -

USER service
WORKDIR /home/service
EXPOSE 8080 50000
CMD [ "java", "-jar", "/opt/jenkins.war" ]

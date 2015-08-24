FROM java:8-jdk

RUN curl -fSLs http://mirrors.jenkins-ci.org/war-stable/1.609.2/jenkins.war -o /opt/jenkins.war \
&& echo '59215da16f9f8a781d185dde683c05fcf11450ef /opt/jenkins.war' | sha1sum -c - \
&& groupadd -g 50000 service \
&& useradd -u 50000 -m -g service service

ENV JENKINS_HOME=/home/service \
    JENKINS_SLAVE_AGENT_PORT=50000

USER service
WORKDIR /home/service
EXPOSE 8080 50000
CMD [ "java", "-jar", "/opt/jenkins.war" ]

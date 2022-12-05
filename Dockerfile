FROM jenkins/jenkins:2.346.2-jdk11

USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_OPTS --httpsKeyStore=/var/lib/jenkins/certificate.pfx --httpsKeyStorePassword=Password12
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
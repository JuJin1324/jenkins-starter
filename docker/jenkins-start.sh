docker run -d \
-p 8099:8080 \
-p 50000:50000 \
--restart=on-failure \
--name jenkins-starter \
-v ~/Documents/dev/jenkins/jenkins_home:/var/jenkins_home \
jenkins/jenkins:lts-jdk11

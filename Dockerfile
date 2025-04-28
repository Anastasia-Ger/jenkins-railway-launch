FROM openjdk:17-jdk

RUN apt-get update && apt-get install -y curl

RUN curl -o /jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

EXPOSE 8080

CMD ["java", "-jar", "/jenkins.war"]

FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl wget tar

RUN wget -O /tmp/jdk22.tar.gz https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.tar.gz \
    && mkdir /opt/jdk-22 \
    && tar -xzf /tmp/jdk22.tar.gz -C /opt/jdk-22 --strip-components=1 \
    && rm /tmp/jdk22.tar.gz

WORKDIR /opt/jenkins

RUN curl -o jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

ENV JAVA_HOME=/opt/jdk-22
ENV PATH="$JAVA_HOME/bin:$PATH"

EXPOSE 8080

CMD ["java", "-jar", "jenkins.war"]

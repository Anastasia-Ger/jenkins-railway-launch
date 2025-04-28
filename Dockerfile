# Используем стабильный образ Java 21
FROM eclipse-temurin:21-jdk

# Устанавливаем curl
USER root
RUN apt-get update && apt-get install -y curl

# Устанавливаем рабочую директорию
WORKDIR /opt/jenkins

# Скачиваем Jenkins
RUN curl -fSL -o jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

# Открываем порт 8080
EXPOSE 8080

# Запускаем Jenkins
CMD ["java", "-jar", "jenkins.war"]

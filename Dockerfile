# Используем готовый образ Java 22
FROM eclipse-temurin:22-jdk

# Обновляем пакеты и устанавливаем curl
USER root
RUN apt-get update && apt-get install -y curl

# Устанавливаем рабочую директорию
WORKDIR /opt/jenkins

# Скачиваем Jenkins WAR файл
RUN curl -o jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

# Открываем порт 8080
EXPOSE 8080

# Запускаем Jenkins
CMD ["java", "-jar", "jenkins.war"]

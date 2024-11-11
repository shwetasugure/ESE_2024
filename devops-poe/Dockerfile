FROM openjdk:21-jdk-slim
WORKDIR /app
COPY devops-poe/target/devops-poe-1.0-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
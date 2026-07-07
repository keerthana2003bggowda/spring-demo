FROM maven:3.9-eclipse-temurin-21
WORKDIR /app
COPY . .
RUN mvn clean package
EXPOSE 8080
CMD ["java", "-jar", "target/spring-demo-0.0.1-SNAPSHOT.jar"]
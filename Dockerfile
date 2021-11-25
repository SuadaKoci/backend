# First Stage - Build Code

FROM maven:3.8.3-jdk-11-slim as build
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package

# Second Stage - Run Code

FROM openjdk:11-jre-slim
WORKDIR /app
ARG JAR_FILE=/app/target/*.jar
COPY --from=build ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
# Stage 1: Build the JAR
FROM gradle:jdk8 AS build-stage  # Define 'build-stage'
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

# Stage 2: Run the JAR
FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /usr/app
COPY --from=build-stage /app/build/libs/*.jar /usr/app/app.jar  # Reference 'build-stage'

ENTRYPOINT ["java", "-jar", "app.jar"]

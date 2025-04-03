FROM openjdk:8-jre-alpine
WORKDIR /usr/app
COPY ./build/libs/*.jar /usr/app/
ENTRYPOINT ["java", "-jar", "your-app.jar"]

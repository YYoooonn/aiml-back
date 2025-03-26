# BUILD ? COPY gradlew
FROM openjdk:17-jdk-slim AS builder

ENV APP_HOME=/usr/app
WORKDIR $APP_HOME
COPY build.gradle settings.gradle gradlew $APP_HOME
COPY gradle $APP_HOME/gradle
COPY src $APP_HOME/src
COPY .env $APP_HOME
RUN ./gradlew dependencies --no-daemon
RUN chmod +x ./gradlew
RUN ./gradlew bootJar

# RUN
FROM openjdk:17-jdk-slim
ENV ARTIFACT_NAME=backend*.jar
ENV APP_HOME=/usr/app
COPY --from=builder $APP_HOME/build/libs/$ARTIFACT_NAME app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

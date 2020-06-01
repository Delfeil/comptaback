FROM balenalib/raspberry-pi:latest
## Install JDK:
RUN apt-get update && apt-get install -y \
    wget \
    openjdk-11-jre

# Set $JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-armhf

VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
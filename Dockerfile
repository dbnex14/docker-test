# Use an official OpenJDK image as the base
FROM openjdk:17-slim

# Set environment variables for Maven
ENV MAVEN_VERSION=3.8.8 \
    MAVEN_HOME=/opt/maven

# Install necessary dependencies and download Maven
RUN apt-get update && apt-get install -y wget tar \
    && wget https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -O /tmp/maven.tar.gz \
    && tar -xzf /tmp/maven.tar.gz -C /opt \
    && mv /opt/apache-maven-${MAVEN_VERSION} $MAVEN_HOME \
    && ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn \
    && rm -rf /tmp/maven.tar.gz

# Verify installations
RUN java -version && mvn -version

# Set default command
CMD ["mvn"]

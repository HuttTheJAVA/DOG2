# Use a base image with Java 17
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy all JAR files from the host to the container's app directory
COPY build/libs/*.jar /app/

# Expose the port the application runs on
EXPOSE 8081

# Define the command to run the JAR file
ENTRYPOINT ["sh", "-c", "java -jar /app/*.jar"]

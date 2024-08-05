# Use a base image with Java 17
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the host to the container
# Replace 'your-app-name-0.0.1-SNAPSHOT.jar' with the actual name of your JAR file
COPY build/libs/mungpy-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the application runs on
EXPOSE 8081

# Define the command to run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
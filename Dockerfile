# Stage 1: Build the application
FROM gradle:7.5-jdk17 AS build

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper and build files
COPY gradle /app/gradle
COPY gradlew /app/
COPY build.gradle /app/
COPY settings.gradle /app/

# Download dependencies
RUN ./gradlew build --no-daemon

# Copy the application source code
COPY src /app/src

# Build the application
RUN ./gradlew build --no-daemon

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/build/libs/mungpy-0.0.1-SNAPSHOT.jar /app/mungpy-0.0.1-SNAPSHOT.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/mungpy-0.0.1-SNAPSHOT.jar"]

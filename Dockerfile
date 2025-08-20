# Base image
FROM amazoncorretto:21

# Set the working directory
WORKDIR /src

# TODO: for faster docker build, lverage the build cache - install dependencies separately before copyign the entire app

# Copy the source code and build
COPY src ./src
RUN ./mvnw clean package -DskipTests  # TODO: remove skiptests later ?

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
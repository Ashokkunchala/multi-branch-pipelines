FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY build/ ./build/
CMD ["java", "-cp", "build", "com.example.App"]

FROM openjdk:11\nWORKDIR /app\nCOPY . /app\nRUN javac src/main/java/com/example/App.java\nCMD ["java", "-cp", "src/main/java", "App"]

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copia el JAR ya compilado
COPY pcge-backend-0.0.1-SNAPSHOT.jar app.jar

# Expón el puerto
EXPOSE 8085

# Comando de ejecución
ENTRYPOINT ["java", "-jar", "app.jar"]

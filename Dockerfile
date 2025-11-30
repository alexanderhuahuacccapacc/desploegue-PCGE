# Imagen base
FROM eclipse-temurin:21-jre-alpine

# Definir directorio de trabajo
WORKDIR /app

# Copiar automáticamente cualquier archivo .jar que esté en la carpeta
COPY *.jar pcge-backend-0.0.1-SNAPSHOT.jar

# Exponer puerto del backend
EXPOSE 8085

# Ejecutar Spring Boot
ENTRYPOINT ["java", "-jar", "app.jar"]

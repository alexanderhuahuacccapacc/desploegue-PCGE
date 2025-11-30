# ---------- Etapa 1: Construcción ----------
FROM eclipse-temurin:21-jdk-alpine AS build

# Crear carpeta de trabajo
WORKDIR /app

# Copiar archivos del proyecto (pom.xml y código fuente)
COPY pom.xml .
COPY src ./src

# Compilar el proyecto y generar el JAR
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests


# ---------- Etapa 2: Ejecución ----------
FROM eclipse-temurin:21-jre-alpine

# Carpeta interna
WORKDIR /app

# Copiar el JAR generado desde la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Puerto del backend
EXPOSE 8085

# Ejecutar Spring Boot
ENTRYPOINT ["java", "-jar", "app.jar"]

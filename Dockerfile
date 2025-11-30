# =========================================================
# ETAPA 1: Construcción del proyecto con Maven
# =========================================================
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copiamos solo los archivos necesarios primero (optimiza cache)
COPY pom.xml .
COPY src ./src

# Construimos el JAR
RUN mvn clean package -DskipTests


# =========================================================
# ETAPA 2: Imagen final con el JAR ejecutable
# =========================================================
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiamos el JAR compilado
COPY --from=build /app/target/*.jar app.jar

# Puerto (si tu Spring Boot usa otro, cámbialo)
EXPOSE 8085

ENTRYPOINT ["java", "-jar", "app.jar"]

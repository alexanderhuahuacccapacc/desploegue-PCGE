# ====== ETAPA 1: COMPILAR EL PROYECTO ======
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Copiar todo el backend al contenedor
WORKDIR /build
COPY pcge-backend-0.0.1-SNAPSHOT.jar


# Compilar y generar el JAR sin tests (más rápido)
RUN mvn clean package -DskipTests


# ====== ETAPA 2: EJECUTAR EL JAR ======
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiar desde la etapa de compilación el jar generado
COPY --from=build /build/target/*.jar app.jar

EXPOSE 8085

ENTRYPOINT ["java", "-jar", "app.jar"]

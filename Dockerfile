# ---------- Etapa 1: Construcción ----------
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

# Copiamos el pom y descargamos dependencias (cache build)
COPY pom.xml .
RUN ./mvnw dependency:go-offline || true

# Copiamos el código
COPY src ./src
COPY mvnw .
COPY .mvn ./.mvn

# Damos permisos de ejecución al wrapper
RUN chmod +x mvnw

# Compilamos el proyecto
RUN ./mvnw clean package -DskipTests

# ---------- Etapa 2: Imagen final ----------
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiamos el jar final desde la etapa builder
COPY --from=builder /app/target/*.jar app.jar

# Render detecta el puerto automáticamente si está expuesto
EXPOSE 8085

# Ejecutamos la app
ENTRYPOINT ["java", "-jar", "app.jar"]

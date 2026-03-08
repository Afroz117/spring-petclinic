FROM eclipse-temurin:17-jre-jammy

RUN useradd -m -u 1001 appuser ---[ attaching a specific uid for Prevents permission mismatch in Kubernetes]

WORKDIR /opt/app

COPY --chown=appuser:appuser target/*.jar app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]

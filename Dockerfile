FROM eclipse-temurin:17 as builder
COPY target/docker.jar /temp/docker.jar
RUN java -Djarmode=layertools -jar /temp/docker.jar extract --destination /extract/

FROM eclipse-temurin:17
ARG APP_HOME=/app

WORKDIR $APP_HOME

COPY --from=builder extract/dependencies/ $APP_HOME/
COPY --from=builder extract/application/ $APP_HOME/
COPY --from=builder extract/spring-boot-loader/ $APP_HOME/
COPY --from=builder extract/snapshot-dependencies/ $APP_HOME/

EXPOSE 8000
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
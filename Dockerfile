FROM alpine:3.10.1 as build
RUN apk --no-cache add openjdk11
RUN apk --no-cache add maven
WORKDIR /build
COPY pom.xml pom.xml
RUN /usr/lib/jvm/default-jvm/bin/jlink \
    --compress=2 \
    --module-path /usr/lib/jvm/default-jvm/jmods \
    --add-modules java.base,java.logging,java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
    --output /jdk-minimal
RUN mvn dependency:go-offline
COPY src src
RUN mvn clean package

FROM alpine:3.10.1
COPY --from=build /jdk-minimal /opt/jdk/
COPY --from=build /build/target/*.jar /image-demo.jar
VOLUME /tmp
EXPOSE 8080
CMD /opt/jdk/bin/java -jar /image-demo.jar




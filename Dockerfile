FROM amazoncorretto:latest

RUN yum install -y libcurl git
RUN git clone https://github.com/spring-projects/spring-petclinic.git && \
    cd spring-petclinic && \
    ./mvnw package
RUN mkdir /petclinic/ && cp -r /spring-petclinic/target/spring-petclinic-*.jar /petclinic/
RUN rm -r /spring-petclinic
WORKDIR /petclinic/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]

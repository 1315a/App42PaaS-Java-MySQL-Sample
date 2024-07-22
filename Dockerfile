FROM maven:3.8.4-jdk-11 as builder

WORKDIR /app

COPY . .

RUN mvn clean package

FROM tomcat:9.0.62-jre11

COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

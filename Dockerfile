FROM tomcat:9.0.52-jre11-openjdk-slim
COPY ./target/com.inn.cafe*.jar /usr/local/tomcat/webapps
EXPOSE  80
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
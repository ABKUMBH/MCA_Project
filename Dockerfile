FROM tomcat:8.0.51-jre8-alpine
COPY ./target/com.inn.cafe*.jar /usr/local/tomcat/webapps
EXPOSE  80
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
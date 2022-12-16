FROM java:8
MAINTAINER zjcoding
VOLUME /tmp
#ARG JAR_FILE
#将jar包添加到容器中并更名为app.jar
ADD target/*.jar app.jar
RUN bash -c 'touch /app.jar'
ENV TZ=Asia/Shanghai
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
EXPOSE 8090
# CMD ["-jar", "/app.jar"]  "nohup" "&"
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

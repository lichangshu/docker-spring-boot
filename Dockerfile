FROM openjdk:8
VOLUME /tmp

ARG JAR=app.jar

ENV SPRING_PROFILES_ACTIVE=online
ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD config/ /opt/app/
ADD $JAR /opt/app/app.jar

EXPOSE 8080
WORKDIR /opt/app/

CMD [ "/usr/bin/java", "-Djava.security.egd=file:/dev/urandom", "-jar", "/opt/app/app.jar" ]



FROM openjdk:11-jdk-slim
RUN addgroup java_group && adduser --ingroup java_group --disabled-password java_user
USER java_user
ENV APP_FILE demo-0.0.1-SNAPSHOT.jar
ENV APP_HOME /usr/apps
EXPOSE 8080
COPY target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]
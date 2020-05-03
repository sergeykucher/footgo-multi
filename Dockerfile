FROM maven:3.6.3-jdk-8 as build
COPY . /footgo
WORKDIR /footgo
RUN mvn package

FROM ubuntu:16.04
COPY --from=build /footgo/target/ROOT.jar /footgo/target/
COPY ./src/main/webapp /footgo/src/main/webapp
COPY ./sh /footgo
WORKDIR /footgo
RUN apt-get update &&\
    apt-get install dos2unix &&\
    dos2unix install_mysql.sh run.sh &&\
    ./install_mysql.sh &&\
    apt-get -y install openjdk-8-jre
EXPOSE 8080
CMD ./run.sh

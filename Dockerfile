FROM debian:wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils wget vim
RUN apt-get install -y openjdk-7-jre
RUN mkdir /etc/minecraft && \
    cd /etc/minecraft && \
    wget http://7xk2f8.media1.z0.glb.clouddn.com/minecraft_server.1.7.10.jar && \
    touch eula.txt && \
    echo "eula=true" > eula.txt 
WORKDIR /etc/minecraft
EXPOSE 25565
CMD ["java","-jar","minecraft_server.1.7.10.jar","nogui"]

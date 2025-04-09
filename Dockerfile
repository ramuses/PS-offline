FROM alpine

WORKDIR /var/run/photopea

RUN apk update && apk upgrade

RUN apk add git python3
RUN cd $WORKDIR

RUN git clone  --progress --verbose https://gitflic.ru/project/photopea-v2/photopea-v-2.git 
RUN cd $WORKDIR/photopea-v-2
RUN python3 Updater.py 

EXPOSE 8887

ENTRYPOINT ["python3", "-m", "http.server", "--directory", "www.photopea.com", "8887"]

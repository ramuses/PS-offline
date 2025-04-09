FROM alpine

WORKDIR /var/run/photopea-v-2

RUN apk update && apk upgrade

RUN apk add git python3

RUN git clone  --progress --verbose https://gitflic.ru/project/photopea-v2/photopea-v-2.git 
RUN ls -l
RUN python3 /var/run/photopea-v-2/Updater.py 

EXPOSE 8887

ENTRYPOINT ["python3", "-m", "http.server", "--directory", "www.photopea.com", "8887"]

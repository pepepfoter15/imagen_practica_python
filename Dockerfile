FROM python:3

MAINTAINER Pepe Rodríguez Cañas "pepepfoter15@gmail.com"
WORKDIR /usr/src/app

COPY django_tutorial /usr/src/app/

RUN pip install --root-user-action=ignore --upgrade pip && pip install -r requirements.txt

RUN test -d static || mkdir static
ADD polls.sh /usr/src/app/
RUN chmod +x /usr/src/app/polls.sh
RUN apt update && apt install iputils-ping -y

ENTRYPOINT ["/usr/src/app/polls.sh"]

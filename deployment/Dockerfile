FROM python:3.7

RUN apt-get clean
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y bzip2 nano zip
RUN apt-get install -y gettext
RUN apt-get install -y openssl
COPY requirements.txt /env/requirements.txt
RUN pip install -r /env/requirements.txt
RUN mkdir /code
WORKDIR /code
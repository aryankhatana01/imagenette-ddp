FROM python:3.8

WORKDIR /imagenet-dpp-exp


ADD ./src /imagenet-dpp-exp/
RUN mkdir data
ADD requirements.txt /imagenet-dpp-exp/

RUN apt-get update -y
RUN apt-get install wget -y

RUN cd data
RUN wget https://s3.amazonaws.com/fast-ai-imageclas/imagenette2-160.tgz
RUN tar -xvf imagenette2-160.tgz
RUN cd ..

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt
RUN python3 -m pip install torch torchvision


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

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install --no-cache-dir torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

ENTRYPOINT [ "./ddp.sh" ]


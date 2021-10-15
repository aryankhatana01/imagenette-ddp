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
RUN pip3 install --no-cache-dir torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 -f https://download.pytorch.org/whl/torch_stable.html

RUN cd src/
ENTRYPOINT [ "./ddp.sh" ]


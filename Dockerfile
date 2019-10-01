FROM python:3

ADD play.py
ADD record.py
ADD requirements.txt
ADD train.py
ADD utils.py

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
RUN /bin/sh cuda_8.0.61_375.26_linux-run --toolkit --silent

CMD python -m SimpleHTTPServer 8080
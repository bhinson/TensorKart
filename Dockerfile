FROM centos:centos7

ADD play.py ~/
ADD record.py ~/
ADD reqs.txt ~/
ADD train.py ~/
ADD utils.py ~/

RUN yum -y install python3
RUN pip3 install --upgrade pip
RUN pip3 install -r ~/reqs.txt
RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
RUN /bin/sh cuda_8.0.61_375.26_linux-run --toolkit --silent

CMD python -m SimpleHTTPServer 8080
FROM centos:centos7

ADD play.py /root/
ADD record.py /root/
ADD reqs.txt /root/
ADD train.py /root/
ADD utils.py /root/

RUN yum -y install freetype-devel
RUN yum -y install libpng
RUN yum -y install python3
RUN yum -y install python3-devel
RUN yum -y install gcc
RUN yum -y install gcc-c++
RUN pip3 install --upgrade pip
RUN pip install numpy
RUN pip3 install -r /root/reqs.txt
RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
RUN /bin/sh cuda_8.0.61_375.26_linux-run --toolkit --silent

CMD python -m SimpleHTTPServer 8080
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
RUN yum -y install wget
RUN pip3 install --upgrade pip
RUN pip install numpy
RUN pip3 install -r /root/reqs.txt


RUN yum install -y epel-release
RUN yum install -y dkms

RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-rhel7-8-0-local-ga2-8.0.61-1.x86_64-rpm
RUN rpm -ivh cuda-repo-rhel7-8-0-local-ga2-8.0.61-1.x86_64-rpm
RUN yum clean all
RUN yum install -y cuda

#RUN chmod 777 /usr/local/cuda-8.0
#RUN /bin/sh cuda_8.0.61_375.26_linux-run --toolkit --silent --toolkitpath=/usr/local/cuda-8.0

CMD python -m SimpleHTTPServer 8080
FROM centos:centos7

#add my files
ADD play.py /root/
ADD record.py /root/
ADD reqs.txt /root/
ADD train.py /root/
ADD utils.py /root/

#install pre-reqs
RUN yum -y install freetype-devel
RUN yum -y install libpng
RUN yum -y install python3
RUN yum -y install python3-devel
RUN yum -y install gcc
RUN yum -y install gcc-c++
RUN yum -y install wget
RUN yum install -y epel-release
RUN yum install -y dkms
RUN yum install -y grub2
RUN yum install -y python3-tkinter
RUN yum install -y rsync

#install pip pre-reqs
RUN pip3 install --upgrade pip
RUN pip install numpy
RUN pip3 install -r /root/reqs.txt

#install cuda libs
RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-rhel7-8-0-local-ga2-8.0.61-1.x86_64-rpm
RUN rpm -ivh cuda-repo-rhel7-8-0-local-ga2-8.0.61-1.x86_64-rpm
RUN yum clean all
RUN yum install -y cuda

RUN wget https://www.dropbox.com/sh/3ryoylmp8rufo4d/AABEKUGBR4yKhiRimLbXlQfHa?dl=0 -O X.npy
RUN wget https://www.dropbox.com/s/w7ckfpjac9ckkuw/y.npy?dl=0 -O y.npy



CMD python -m SimpleHTTPServer 8080
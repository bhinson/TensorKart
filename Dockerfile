FROM centos:centos7

#add my files
ADD play.py /root/
ADD record.py /root/
ADD reqs.txt /root/
ADD train.py /root/
ADD utils.py /root/

#install pre-reqs
RUN yum -y install freetype-devel libpng gcc gcc-c++ wget epel-release dkms grub2 make centos-release-scl python3 python3-devel python3-tkinter
#RUN yum -y install rh-python35 rh-python35-python-tkinter
RUN yum -y groupinstall 'Development Tools'
#RUN yum -y install python3
#RUN yum -y install python3-devel
#RUN yum -y install gcc
#RUN yum -y install gcc-c++
#RUN yum -y install wget
#RUN yum install -y epel-release
#RUN yum install -y dkms
#RUN yum install -y grub2
#RUN yum install -y python3-tkinter
#RUN yum install -y make




#install python pre-reqs
RUN pip3 install --upgrade pip
RUN pip3 install numpy
RUN pip3 install -r /root/reqs.txt




#install cuda libs
RUN wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.168_418.67_linux.run -O /root/cuda_10.1.168_418.67_linux.run
RUN sh /root/cuda_10.1.168_418.67_linux.run --silent --toolkit --toolkitpath=/usr/local/cuda-10.1 --installpath=/usr/local/cuda-10.1

#CUDA 8
#RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run -O /root/cuda_8.0.61_375.26_linux-run
#RUN sh /root/cuda_8.0.61_375.26_linux-run --toolkit --silent





RUN mkdir /root/data
RUN wget https://www.dropbox.com/s/x0orqhrfihf6hsz/x.npy?dl=0 -O /root/data/X.npy
RUN wget https://www.dropbox.com/s/w7ckfpjac9ckkuw/y.npy?dl=0 -O /root/data/y.npy



CMD python -m SimpleHTTPServer 8080
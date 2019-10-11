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




#install cuda 10.0 libs
RUN wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux -O /root/cuda_10.0.130_410.48_linux --quiet
RUN sh /root/cuda_10.0.130_410.48_linux --silent --toolkit --toolkitpath=/usr/local/cuda-10.0

#Get cudnn libs from NVIDIA
RUN wget https://www.dropbox.com/s/l5t159ily3m10sg/cudnn-10.0-linux-x64-v7.6.4.38.tgz?dl=0 -O /root/cudnn-10.0-linux-x64-v7.6.4.38.tgz
RUN tar -C /usr/local/ -xzf /root/cudnn-10.0-linux-x64-v7.6.4.38.tgz

#install cuda 10.1 libs
#RUN wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.168_418.67_linux.run -O /root/cuda_10.1.168_418.67_linux.run --quiet
#RUN sh /root/cuda_10.1.168_418.67_linux.run --silent --toolkit --toolkitpath=/usr/local/cuda-10.1 --installpath=/usr/local/cuda-10.1

#CUDA 8
#RUN wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run -O /root/cuda_8.0.61_375.26_linux-run
#RUN sh /root/cuda_8.0.61_375.26_linux-run --toolkit --silent





RUN mkdir /root/data
RUN wget https://www.dropbox.com/s/x0orqhrfihf6hsz/x.npy?dl=0 -O /root/data/X.npy --quiet
RUN wget https://www.dropbox.com/s/w7ckfpjac9ckkuw/y.npy?dl=0 -O /root/data/y.npy --quiet



CMD python -m SimpleHTTPServer 8080

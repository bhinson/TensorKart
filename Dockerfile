FROM centos:centos7

#add my files
ADD reqs.txt /root
RUN mkdir /root/tensor
ADD tensor/play.py /root/tensor/
ADD tensor/record.py /root/tensor/
ADD tensor/train.py /root/tensor/
ADD tensor/utils.py /root/tensor/
RUN mkdir /root/uploads/
RUN chmod 777 /root/uploads
RUN mkdir /root/flask
ADD flask/app.py root/flask/
ADD flask/main.py root/flask/



#install pre-reqs
RUN yum -y install freetype-devel libpng gcc gcc-c++ wget epel-release dkms grub2 make centos-release-scl python3 python3-devel python3-tkinter
#RUN yum -y install rh-python35 rh-python35-python-tkinter
RUN yum -y groupinstall 'Development Tools'


#install python pre-reqs
RUN pip3 install --upgrade pip
RUN pip3 install numpy flask shutil
RUN pip3 install -r /root/reqs.txt




#install cuda 10.0 libs
RUN wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux -O /root/cuda_10.0.130_410.48_linux --quiet
RUN sh /root/cuda_10.0.130_410.48_linux --silent --toolkit --toolkitpath=/usr/local/cuda-10.0

#Get cudnn libs from NVIDIA
RUN wget https://www.dropbox.com/s/l5t159ily3m10sg/cudnn-10.0-linux-x64-v7.6.4.38.tgz?dl=0 -O /root/cudnn-10.0-linux-x64-v7.6.4.38.tgz
RUN tar -C /usr/local/ -xzf /root/cudnn-10.0-linux-x64-v7.6.4.38.tgz



RUN mkdir /root/data
RUN wget https://www.dropbox.com/s/x0orqhrfihf6hsz/x.npy?dl=0 -O /root/data/X.npy --quiet
RUN wget https://www.dropbox.com/s/w7ckfpjac9ckkuw/y.npy?dl=0 -O /root/data/y.npy --quiet



CMD python3 /root/flask/main.py

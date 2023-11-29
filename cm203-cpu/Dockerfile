FROM python:3.10.12-bookworm

COPY common_install.sh /common_install.sh
RUN /bin/bash /common_install.sh

RUN pip3 install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cpu && \
    pip3 install fastai==2.7.12 opencv-contrib-python-headless==4.8.0.76
RUN pip3 install -U Pillow==9.4.0
RUN apt install graphviz -y && pip3 install graphviz==0.20.1
RUN pip3 install datasets==2.14.5 timm==0.9.7
RUN pip3 install albumentations==1.3.1

#RUN useradd -ms /bin/bash jupyter
#USER jupyter
ADD custom.css /root/.jupyter/custom/

ENV TORCH_HOME="/content/torch_home"
ENV FASTAI_HOME="/content/fastai_home"
ENV HF_DATASETS_CACHE="/content/huggingface/datasets"

WORKDIR /project
CMD ["jupyter", "notebook","--ip=0.0.0.0","--no-browser","--allow-root"]

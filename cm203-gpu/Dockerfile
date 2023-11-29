FROM nvcr.io/nvidia/pytorch:23.06-py3

# RUN pip3 install jupyter-contrib-nbextensions==0.7.0 && pip3 install nbgrader==0.8.1 \
#     jupyter nbextension install --sys-prefix --py nbgrader --overwrite && \
#     jupyter nbextension enable --sys-prefix --py nbgrader && \
#     jupyter serverextension enable --sys-prefix --py nbgrader && \
#     jupyter contrib nbextension install --sys-prefix && \
#     jupyter nbextension enable toc2/main --sys-prefix && \
#     jupyter nbextension enable autosavetime/main --sys-prefix && \
#     jupyter nbextension enable collapsible_headings/main --sys-prefix && \
#     jupyter nbextension enable notify/notify --sys-prefix && \
#     jupyter nbextension enable spellchecker/main --sys-prefix
# RUN apt-get update && apt-get install apt-utils jq -y && apt-get install ffmpeg libsm6 libxext6 tesseract-ocr -y && \
#     pip3 install -U opencv-contrib-python-headless==4.8.0.74 numpy==1.22.4 Pillow==9.4.0 matplotlib==3.7.1 scipy==1.10.1 pandas==1.5.3 pytesseract==0.3.10 gdown && \
#     pip3 install fastai==2.7.12 && \
#     jq '.autosavetime_set_starting_interval=true | .CodeCel.cm_config.indentUnit="2" | .spellchecker.aff_url="https://raw.githubusercontent.com/JetBrains/hunspell-dictionaries/master/pt_BR/pt_BR.aff" | .spellchecker.dic_url="https://raw.githubusercontent.com/JetBrains/hunspell-dictionaries/master/pt_BR/pt_BR.dic" | .spellchecker.lang_code="pt_BR"' /usr/local/etc/jupyter/nbconfig/notebook.json > temp.json && mv temp.json /usr/local/etc/jupyter/nbconfig/notebook.json
# RUN jupyter nbextension disable spellchecker/main --sys-prefix
# ADD custom.css /root/.jupyter/custom/
#RUN useradd -ms /bin/bash jupyter
#USER jupyter

#RUN pip3 install -U notebook==6.4.12
RUN rm -rf /usr/local/etc/jupyter && pip3 uninstall -y jupytext
ENV DEBIAN_FRONTEND=noninteractive 
COPY common_install.sh /common_install.sh
RUN /bin/bash /common_install.sh

RUN pip3 install fastai==2.7.12
RUN pip3 install -U Pillow==9.4.0
RUN apt install graphviz -y && pip3 install graphviz==0.20.1
RUN pip3 install datasets==2.14.5 timm==0.9.7
RUN pip3 install albumentations==1.3.1 opencv-python-headless==4.6.0.66

#RUN useradd -ms /bin/bash jupyter
#USER jupyter
ADD custom.css /root/.jupyter/custom/

ENV TORCH_HOME="/content/torch_home"
ENV FASTAI_HOME="/content/fastai_home"
ENV HF_DATASETS_CACHE="/content/huggingface/datasets"

WORKDIR /project
CMD ["jupyter", "notebook","--ip=0.0.0.0","--no-browser","--allow-root"]

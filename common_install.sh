pip3 install nbgrader==0.8.1
jupyter nbextension install --sys-prefix --py nbgrader --overwrite
jupyter nbextension enable --sys-prefix --py nbgrader
jupyter serverextension enable --sys-prefix --py nbgrader
jupyter contrib nbextension install --sys-prefix
jupyter nbextension enable toc2/main --sys-prefix
jupyter nbextension enable autosavetime/main --sys-prefix
jupyter nbextension enable collapsible_headings/main --sys-prefix
jupyter nbextension enable notify/notify --sys-prefix
jupyter nbextension enable spellchecker/main --sys-prefix
apt-get update && apt-get install apt-utils jq -y && apt-get install ffmpeg libsm6 libxext6 tesseract-ocr -y
pip3 install -U opencv-contrib-python-headless==4.8.0.74 pytesseract==0.3.10 gdown
jq '.autosavetime_set_starting_interval=true | .CodeCell.cm_config = { "indentUnit": 2, "tabSize": 2 } | .spellchecker.aff_url="https://raw.githubusercontent.com/JetBrains/hunspell-dictionaries/master/pt_BR/pt_BR.aff" | .spellchecker.dic_url="https://raw.githubusercontent.com/JetBrains/hunspell-dictionaries/master/pt_BR/pt_BR.dic" | .spellchecker.lang_code="pt_BR"' /usr/local/etc/jupyter/nbconfig/notebook.json > temp.json && mv temp.json /usr/local/etc/jupyter/nbconfig/notebook.json
jupyter nbextension disable spellchecker/main --sys-prefix # Very slow, not working :(

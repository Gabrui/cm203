# CM-203

Materiais de apoio para o curso de Introdução à Visão Computacional, Prof. Marcos Máximo e Gabriel Melo

## Aulas

[Aula 1 - Introdução a Visão Computacional](https://docs.google.com/presentation/d/1PYRArTIBh9vQ5r7DvEwGgbZp8FCkrwZnkQuFZ-z-snc/)

[Aula 2 - Redes Neurais Artificiais](https://docs.google.com/presentation/d/1Dpc-qkhuK5CSAl2MugB-D8tHyDn1l6ef5Ntw-eC49ms/)

[Aula 3 - Deep Learning](https://docs.google.com/presentation/d/1pbXPJvpGoDK03KsazRf3D99-FXNd2FLcXpIVPl797PA/)

[Aula 4 - Visão Clássica: Filtros](https://docs.google.com/presentation/d/1gLFN-15tXYV5eUhJzMY9fo4iyvAkqLbi/)

[Aula 5 - CNNs: Redes Neurais Convolucionais](https://docs.google.com/presentation/d/1HbLq7rk3G86uxWc2l4l9wopyxlrhsLxrWq-vyIzMJa8/)

[Aula 6 - Detecção de Objetos](https://docs.google.com/presentation/d/1OecOBg2EmgVLgaWuz-uM9jCxoKs7FgprZgkomiQCGuE/)

[Aula 7 - Detecção de Objetos Avançada](https://docs.google.com/presentation/d/14BFrPhWrB6xghCgAFB-1g_wTYJhDGWyGEpmyydZBvdw/)

## Laboratórios

Estão na pasta `notebooks`.

[Laboratório 1 - Operações Básicas com Imagem e Classificação básica](notebooks/intro_lab01/intro_lab01.ipynb)

[Laboratório 2 - nanoGrad: Automatic Gradient Backpropagation](notebooks/nanograd_lab02/nanograd_lab02.ipynb)

[Laboratório 3 - NeRFs: Neural Radiance Fields](notebooks/nerfs_lab03/nerfs_lab03.ipynb)

[Laboratório 4 - Image Processing: Convolutions](notebooks/processing_lab04/processing_lab04.ipynb)

[Laboratório 5 - CNNs: Implementing a FastAI like interface](notebooks/cnns_lab05/cnns_lab05.ipynb)

They can be downloaded and executed locally with our docker containers (which run Jupyter Notebooks classic) or open in Google Colab in the browser.

The notebooks should be submitted to the Google Classroom assignment and are graded in two steps: automatic code execution with assert checking and manual code review with teacher's comments. The feedback is generated as an html page with the notebooks' outputs and the comments made by the teacher.

## Docker

Para executar, o contêiner, utilize o docker compose (dentro desta pasta):

```bash
docker compose -f jupytercpu.yml up
```

## Dependências

É necessário ter instalado o [docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

```bash
curl https://get.docker.com | sh && sudo systemctl --now enable docker
```

OBS: para executar o docker o seu usuário deve estar no grupo docker ou se root (relogue depois do seguinte comando):

```bash
sudo usermod -aG docker $(whoami)
```

### Docker com GPU Nvidia

Você já deve ter o driver da nvidia instalado em sua máquina (host) `sudo apt-get install nvidia-driver-525` (use a versão igual ou superior à 525), assim seguimos as [instruções](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-on-ubuntu-and-debian):

```bash
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
  	&& curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  	&& curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
        	sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
        	sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install nvidia-container-toolkit
sudo systemctl restart docker && sudo usermod -aG docker $(whoami)
```

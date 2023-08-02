# CM-203

Materiais de apoio para o curso de Introdução à Visão Computacional, Prof. Marcos Máximo e Gabriel Melo

Para executar, o contêiner, utilize o docker compose (dentro desta pasta):

```
docker compose -f jupytercpu.yml up
```

## Dependências

É necessário ter instalado o [docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

```
curl https://get.docker.com | sh && sudo systemctl --now enable docker
```

### Docker com GPU Nvidia

Você já deve ter o driver da nvidia instalado em sua máquina (host) `sudo apt-get install nvidia-driver-525` (use a versão igual ou superior à 525), assim seguimos as [instruções](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-on-ubuntu-and-debian):

```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
  	&& curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  	&& curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
        	sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
        	sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install nvidia-container-toolkit
sudo systemctl restart docker && sudo usermod -aG docker $(whoami)
```

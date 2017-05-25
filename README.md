
Mapas Culturais App BOX
=============================

Mapas-app-box é um ambiente de desenvolvimento para aplicativos móveis com Ionic, Cordova e Android. Já está com os pacotes instalados e configurado para a release 1.0.3 do app Android do Mapas Culturais (Agenda Cultural).

Além de facilitar o desenvolvimento do aplicativo Android de Agenda Cultural do Mapas Culturais, o Mapas-app-box também fornece um ambiente de desenvolvimento completo para aplicativos Ionic baseados na versão 1 da Lib (v1). Pode ser usado por usuários Windows também.

A Mapas-app-box não foi configurada para desenvolvimento em IOS. Quem precisar, atualize a box que aceitamos pull requests ;-)

### SLIDES DO CURSO HACKEANDO APLICATIVOS ANDROID

[Versão ODP](https://github.com/cidadedemocratica/mapas-app-box64/blob/9c7b4c180223b27c094bfd5024a1a6d68342ecbd/slides/%5BLabs%20Livres%5D%20%5BAula%201%20e%202%5D%20Curso-%20como%20hackear%20e%20modificar%20aplicativos%20livres%20de%20celular%20android.odp?raw=true)

[Versão PDF](https://github.com/cidadedemocratica/mapas-app-box64/raw/master/slides/%5BLabs%20Livres%5D%20%5BAula%201%20e%202%5D%20Curso-%20como%20hackear%20e%20modificar%20aplicativos%20livres%20de%20celular%20android.pdf)


### Versões instaladas na VM

Imagem Vagrant box: mapas-app-box64

Java: openjdk-8-jdk
Node.js: v4.4.4
Cordova CLI: 6.5.0
Gulp version: CLI version 3.9.1
Ionic CLI Version: 1.7.14
Ionic App Lib Version: 0.7.0
Android SDK: tools_r25.2.3-linux
Android SDK packages: platform-tool,android-25,build-tools-25.0.0,extra-google-m2repository,extra-android-m2repository

OS: Distributor ID: Ubuntu 
Description: Ubuntu 14.04.5 LTS 
Type: 64 bits


### Instalação

O Mapas-app-box é baseado em Vagrant. Para usuários debian e ubuntu o Vagrant poder ser instalado via "apt-get". Quem quiser instalar direto da fonte acessa vai direto no site do [Vagrant](https://www.vagrantup.com/downloads.html) e escolha sua plataforma. Também é necessário baixar e instalar o [VirtualBox](http://virtualbox.org/).

Uma vez instalados o Vagrant e o VirutalBox:
1) Clone (ou baixe) esse repositório: https://github.com/cidadedemocratica/mapas-app-box64.git
2) Pelo shell, , 'cd' dentro da pasta do repositorio mapas-app-box64
3) Baixe o [arquivo da box] (https://drive.google.com/file/d/0B7VSUSGkIS-zTGlGMVowWUdFbUk) (aprox 2GB)
4) Adicione a box, suba e acesse a máquina, executando:

```bash
$ vagrant box add mapas-app-box64 mapas-app-box64.box
$ vagrant up
$ vagrant ssh
```

O usuário da vm é `vagrant` e a senha é `vagrant`. 

A imagem é baseada na versão 14.04 do sistema operacional Ubuntu (trusty) para 64 bits. Ha um script de provisionamento 'bootstrap.sh' que não está sendo executado pelo Vagrantfile, já que os pacotes referidos nele estão todos instalados na VM. Use-o como uma referencia do que foi instalado e ativado na VM.

O App do mapas fica na pasta "/home/vagrant/mapasculturais-app" que é um clone do repositório oficial do app no github: https://github.com/hacklabr/mapasculturais-app.git

O README do app explica como rodar no servidor do ionic ou no dispositivo android. Lembrando que é só compilar e rodar, pois todos os pacotes e dependências já estão instalados.


### Para conectar dispositivos Android

O Vagrant file adiciona filtros USB para que a VM reconheça as portas USB da máquina host (principal). Prepare o seu dispositivo Android colocando-o no modo desenvolvedor (normalmente clicando 5 a 8 vezes no número da build na tela de informação do smartphone) e também ativando a depuração USB nas configurações de desenvolvimento.

Quando o dispositivo estiver com isso ativado e conectado à maquina host, ative o adb server com o comando abaixo. Isso levará o dispositivo Android a perguntar se aceita a conexão do computador, responda aceitando.

```bash
$ sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices
```

Se não funcionar de primeira, reinicie o adb server até o dispositivo Android reconhecer o computador na conexão adb (depuração usb):

```bash
sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
```

Também vale ajustar a configuração de "--vendorid", "0x18d1"" no Vagrantfile para o correspondente ao fabricante do seu dispositivo Android.

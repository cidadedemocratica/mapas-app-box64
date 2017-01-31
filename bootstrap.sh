#!/usr/bin/env bash

ANDROID_SDK_FILENAME=tools_r25.2.3-linux.zip
ANDROID_SDK=https://dl.google.com/android/repository/$ANDROID_SDK_FILENAME

#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository -y ppa:openjdk-r/ppa

sudo apt-get update
sudo apt-get install -y npm git openjdk-8-jdk ant expect unzip
sudo npm install -g n
sudo n 4.4.4

sudo npm install -g cordova
cordova telemetry on

sudo npm install -g ionic@1.7.14

sudo npm install -g bower
sudo npm install -g gulp

git clone https://github.com/hacklabr/mapasculturais-app.git

sudo npm install phonegap


curl -O $ANDROID_SDK
mkdir android-sdk-linux
#tar xzvvf $ANDROID_SDK_FILENAME
unzip $ANDROID_SDK_FILENAME -d android-sdk-linux/
sudo chown -R vagrant android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc

expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-25,build-tools-25.0.0,extra-google-m2repository,extra-android-m2repository
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'
#spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-22,build-tools-22.0.1,extra-google-m2repository,extra-android-m2repository


#wget http://dl.google.com/android/repository/platform-25_r03.zip
#mkdir android-sdk-linux/platforms/android-25/
#unzip platform-25_r03.zip -d android-sdk-linux/platforms/
#mv android-sdk-linux/platforms/android-7.1.1 android-sdk-linux/platforms/android-25

#sudo gem install sass

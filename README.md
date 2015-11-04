Django-Vagrant Boilerplate
===

A minimal Django boilerplate

Requirements
===
* <a href="https://www.vagrantup.com/downloads.html" target="_blank">Vagrant</a>
* <a href="https://www.virtualbox.org/wiki/Downloads" target="_blank">VirtualBox</a>
* <a href="https://git-scm.com/downloads" target="_blank">Git</a>

install these requirements and continue

Setup
===

* Download <a href="https://github.com/araratpoghosyan/PyBack/archive/master.zip" target="_blank">Zip Archive</a> and unzip it.
* Open Vagrantfile with text editor and change **config.vm.hostname** value (payback) to your project name, ex. **config.vm.hostname = "project"**.
* Copy **salt/pillar/config.sls.dist** file to **salt/pillar/config.sls**. Here you can specify all your configurations that will affect your installation.
* Copy **salt/salt/nginx/conf/nginx.dev.conf** to **salt/salt/nginx/conf/nginx.conf**. This will be your nginx host configuration file.
* Copy **system/settings.dist.py** to **system/settings.py**.
* Open **terminal** (on Mac) or **cmd** (on Windows) and change your working directory to unzipped folder.
* Run ```vagrant up```
* Run ```vagrant ssh``` to login to your vm over SSH
* Run ```cd /var/www```
* Run ```sudo sh salt/scripts/install.sh -P``` to install Salt Minion
* Run ```sudo sh scripts/provision.sh``` to run salt states

**After this steps you will have server with all its requirements.**

Here we go! Now you can open <a href="http://192.168.10.10" target="_blank">http://192.168.10.10</a> in your browser and if you see nice Django welcome screen, it means that setup was successful, congrats!

Update Server
===

Everytime you want to update your project from SVC just run ```sudo sh scripts/update.sh``` in your ```/var/www``` directory. It will automaticaly pull your project and run deployment commands. You are free to make changes in this script to extend update functionality.

Important
===
* PyBack assumes that you have only **one project** on a **single server**. Of course you can change it as you want, to fit your requirements.
* **Do not** execute update.sh script on your local machine, id can accidentally revert all your changes. 
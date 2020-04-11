# team-container

Team-container is a collection of containers that set up your own collaboration server. This setup is meant to be used in conjunction with a magazine article in c't magazine. See (https://www.heise.de/select/ct/2020/9/2007712573850503640). The article is behind a paywall, but the setup works without the article.

## Tools in this collection

* [Træfik Router](https://docs.traefik.io)
* [Nextcloud](https://nextcloud.com)
* [Rocket.Chat](https://rocket.chat)
* [Jitsi Meet](https://jitsi.org)

# Goal, Prerequisites and Architecture

The goal is to provide a private collaboration server for a small to medium sized team that provides essential services while leaving you in control of where the data are stored. The services are:
* *Nextcloud* for sharing documents and calendars
* *Rocket.Chat* for well organized browser based text chat. Apps for mobile platforms are available.
* *Jitsi Meet* for browser based video conferencing. Apps for mobile platforms are available.

All you need is 
* A linux server, prefarably running Ubuntu 18.04 LTS or another Debian GNU/Linux derivate.
* A domain name, e.g. example.org and four subdomains pointing to your server, i.e. www.example.org, cloud.example.org, chat.example.org and video.example.org
* basic experience with the linux terminal

Knowledge of container technology or other typical linux admin topics is not required.

The first container ((Kubernetes, Rancher, helm) you install contains Traefik. Traefik routes incoming traffic to either the web server nginx or one of the other three containers you will install subsequently. Each of those containers runs an instance of Nextloud, Rocket.Chat or Jitsi Meet. The routing decision is based on the server name specified when setting up the containers. All four servers should have the same domain name.

# Getting started

* prepare a server with a current version of Linux server (tested with Ubuntu Server 18.04 LTS)
* setup four dns entries for your server (e.g. www.example.org, cloud.example.org, chat.example.org, video.example.org)
* clone this repository: `git clone https://github.com/ct-open-source/team-container`
* navigate into the folder team-container
* run `sudo install.sh`
* open "values-setup.yaml". Enter your e-Mail address, set production to true, enter the main server name (e.g. www) and domain name. 
* install Traefik, the router: `helm install setup team-setup --values values-setup.yaml`
* wait a few minutes - until https://yourserver.example.com returns the nginx welcome page using a valid Let's Encrypt TLS certificate. Traefik and nginx are now functional.
* open "values-nextcloud.yaml". Enter server name (e.g. cloud), domain name (e.g. example.org), a name for the Nextcloud administrator and the initial password for the Nextcloud administrator. 
* install Nextcloud: `helm install setup team-nextcloud --values values-nextcloud.yaml`
* After a few minutes your own Nextcloud server will be up and running under https://cloud.example.org. You can log in as the administrator with the password you provided in the last step. Proceed and add regular users. Or
* open "values-chat.yaml". Enter server name (e.g. chat), domain name (e.g. example.org), a name for the Rocket.Chat administrator, the initial password for the Rocket.Chat administrator and his e-mail adress. 
* install Rocket.Chat: `helm install chat team-chat --values values-chat.yaml`
* after a few minutes your own Rocket.Chat server will be up and running under https://chat.example.org. You can log in as the administrator with the password you provided in the last step. Proceed and add regular users. Or
* open "values-video.yaml". Enter server name (e.g. video) and domain name (e.g. example.org) 
* install Jitsi Meet: `helm install video team-video --values values-video.yaml`
* after a few minutes your own Jitsi Meet video chat server will be up and running under https://video.example.org. 
* please refer to the above mentioned project web sites for help on using the services.



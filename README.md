# team-container

A collection of containers to start a collaboration server.

## Tools in this collection

* Nextcloud
* Rocket.Chat
* Jitsi Meet
* Træfik Router

# Getting started

* prepare a server with a current version of Linux server (tested with Ubuntu Server)
* setup your dns entrys for your server (e.g. cloud.example.org, video.example.org, ...)
* clone this repository: `git clone https://github.com/ct-open-source/team-container`
* navigate into the folder
* run `install.sh`
* open "values-setup.yaml" and enter your domain
* install router: `helm install setup team-setup --values values-setup.yaml`

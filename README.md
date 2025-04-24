# Voice over IP 2

A short course on the integration of VoIP services (Asterisk primarily, Kamailio optionally) with other key elements of the information system environment, such as database (PostgreSQL) and HTTPS API for management.

The whole setup is dockerized to allow simple deployment.

The high level architecture is depicted in the following figure:

![voip2_basic diagram drawio](https://github.com/user-attachments/assets/59f61b35-ca4e-4132-8937-496199cbe06b)

# Instalace dockeru

`sudo apt update`

`sudo apt upgrade -y`

`sudo apt install apt-transport-https ca-certificates curl software-properties-common -y`

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`

`echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

`sudo apt update`

`sudo apt install -y docker-ce docker-ce-cli containerd.io`

`docker --version`

`sudo systemctl enable docker`

`sudo usermod -aG docker ${USER}`

`newgrp docker`

`docker run hello-world`

# # Instalace docker compose

`curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -`

`chmod +x docker-compose-linux-x86_64`

`sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose`

`docker-compose version`

## Vytváření adresáře

`mkdir -p ~/voip-stack`

`cd ~/voip-stack`

## Kamailio

`mkdir -p ./config/kamailio`

V **./config/kamailio/** vytvoříme soubor **kamailio.cfg**, do kterého vložíme obsah ze stejnojmenného souboru na githubu.


.
├── docker-compose.yml          # Docker konfigurace pro celý stack
├── config/
│   └── asterisk/
│       ├── pjsip.conf          # Konfigurace SIP uživatelů (PJSIP)
│       └── extensions.conf     # Definice dialplanu pro Asterisk
├── backend/
│   └── main.py                 # Backendová logika (např. API nebo logika pro řízení hovorů)
├── nginx.conf                  # Konfigurace reverzní proxy serveru Nginx
├── ssl/
│   ├── nginx.crt               # SSL certifikát pro HTTPS
│   └── nginx.key               # Privátní klíč certifikátu









Níže je popsána doporučená struktura adresářů jednotlivých komponent.

Struktura adresářů ve "voip-stack":



V souboru docker-compose.yml je nutno definovat veškeré kontejnery

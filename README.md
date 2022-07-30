# iga-project

This code is the final project of Introduction to Environmental Manage of the Universidad del Valle Cali, CO. It's a prototype of IOT based house water and energy consumption app, for more info read the `latex/main.pdf` essay.

![app architecture diagram](https://github.com/sebastianaf/iga-project/blob/main/latex/img/achitecture.png?raw=true)

## Requirements

The code inside `server` folder is built using NodeJS with ExpressJS, ReactJS with Tailwindcss and PostgreSQL all over containers, and the code inside `iot` is for be used over RaspberryPi with at least ARMv6, in this project we use the components a analog to digital converter [ADS1015](https://pdf1.alldatasheet.com/datasheet-pdf/view/292738/TI/ADS1015.html), Temperature and humidity sensor [DHT11](https://components101.com/sensors/dht11-temperature-sensor), a water flow sensor [YF-S201](https://www.mantech.co.za/datasheets/products/yf-s201_sea.pdf), The Hall Effect sensor (to metter electric current) [SCT013](https://pdf1.alldatasheet.com/datasheet-pdf/view/1160244/YHDC/SCT013-050.html) and the Voltage metter sensor [ZMPT101B](https://pdf1.alldatasheet.com/datasheet-pdf/view/1131993/ETC2/ZMPT101B.html). To run this project make sure to install [Docker compose](https://docs.docker.com/).

Now let's follow the next steps.

### 1.Clone the repo

This project have been designed to run over a Docker node and a IOT computer which supports Docker like Raspberry Pi with a Linux distro.

#### Into the server

```
git clone https://github.com/sebastianaf/iga-project
cd server
```

#### Into the IOT device

```
git clone https://github.com/sebastianaf/iga-project
cd iot
```

### 2.Create environment variables

Create a `.env` from `.env.example` file in the `server` and `iot` folder with all environment variables, this variables will be used by the containers, it need to be between `docker-compose.yml` files inside `server` and `iot` folders.

Inside `server/ui` make sure to create `.env.production` for production environment or just `.env` for development environment. (Based on [create-react-app](https://create-react-app.dev/))

### 3.Connect the sensors

Pendding to build with Fritzing, meanwhile this is the conection map.

```
Raspberry Pi
GPIO 02 -> ADS1015/SDA
GPIO 03 -> ADS1015/SCL
GPIO 20 -> DHT11
GPIO 21 -> YF-S201

ADS1015
A0 -> SCT013
A1 -> ZMPT101B
```

### 4.Setting up a reverse proxy (Optional)

The `docker-compose.yml` file will deploy two services and a docker network to work with a cloud serving environment and a reverse proxy setup. If you don`t have a static public IP we highly recommend to use this API service behind a reverse proxy e.g. [nginx-proxy-manager](https://nginxproxymanager.com/) with [DuckDNS](https://www.duckdns.org) or equivalent and to configure your port Forwarding ISP modem, do not forget try to configure a firewall, (e.g. [OPNSense](https://opnsense.org/)).

The `docker-compose.yml` files are built to work in a private isolate Docker network, make sure to include inside the a reverse-proxy container to expose the `server-ui`, `server-api`, `iot-mqtt-broker` services.

### Run

At the end just type for each environment, server(a server with Docker) and iot(an Raspberry Pi or equivalent device running a Linux distro) the next command and be sure to uncomment deleting the `#` simbol from `docker-compose.yml`'s ports sections and finally type.

#### Into the server

```
docker compose -p uv-iga-server up -d --build
```

#### Into the IOT device

```
docker compose -p uv-iga-iot up -d --build
```

This commands will wake up the services access it thought port specified as follow.

```
Server ports:
9010: api      
9020: db       
9030: ui       
9040: pgadmin  

IOT Device ports:
9010: mqtt-broker 
9020: db          
9030: pgadmin
```

If you set the environment variable `API_CREATE_ADMIN` to `1` then the user credentials for first access are:

```
Username: admin
Password: admin
```

After first start up set `API_CREATE_ADMIN` to `0`

## Folder contents

```
See the repo content.
```

Use this code if you need it, don´t forget to share, have a nice day.

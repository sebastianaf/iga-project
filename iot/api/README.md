# generic-api
This is a quickstart code to build backend services from scratch to any project, it contends a RESTful API template, a database service with Sequelize and PostgreSQL and a Internet home deploy preSetup all with Docker.

## Requirements
This code is built using NodeJS with ExpressJS and other packages (please see the `package.json` for more info).

To run this project make sure to install [Docker](https://docs.docker.com/).

Now let's follow the next steps.

### 1. Create environment variables
Create a `.env` from `.env.example` file with the environment variables, this variables will be used by the containers.

### 2. Change `org` and `project` names
It's recommend to change all the names in files and lines (in `docker-compose.yml` and `Dockerfile`'s files) named with `org` and `project` with your own organization name and project name.

### 3. Deploy
At the end just type
```
docker build -t org-project-api
docker run -p 8080:${API_PORT} -d org-project-api
```
This commands will build a Docker image ready to run and will run it. The server access it thought port `8080`.

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
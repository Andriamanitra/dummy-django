# dummy django project

An example configuration for running a django project with docker (and docker-compose).

Most of the configuration is in `docker-compose.yml` file that runs 3 different services in separate docker containers:
* [Django](https://www.djangoproject.com/) / [Gunicorn](https://gunicorn.org/) running the app itself
* [Caddy](https://caddyserver.com/) web server which will handle SSL certificates and act as a reverse proxy
* [Postgres](https://www.postgresql.org/) database which will store the data in a docker volume

Since everything runs in docker containers you don't need to install any of those on your machine.
You will only need [docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/install/).
The command to run the full application is `docker-compose up`. To stop it run `docker-compose down`.


## Deploying

To use this configuration in production you should do at least the following changes:
1. `.env` file should be modified to use the domain name of your application, and a secure secret key and postgres password (make sure to not commit any secrets to git!)
1. make sure Django's `settings.py` follows [deployment checklist](https://docs.djangoproject.com/en/dev/howto/deployment/checklist/)
1. (if required by your application) [configure Caddy to serve static files](https://caddyserver.com/docs/quick-starts/static-files#caddyfile)


## justfile

The included `justfile` makes it easier to run some commonly used commands, for example `just psql` opens
`psql` database shell inside the docker container for the database.
To take advantage of it you need to install the [just](https://github.com/casey/just) command runner.
Run `just --list` to see the available recipes.

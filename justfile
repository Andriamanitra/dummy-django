set dotenv-load

# run psql in dummyproject-db container
psql:
    docker-compose exec dummyproject-db psql $POSTGRES_DB --username=$POSTGRES_USER

# open shell in caddy container
caddy-sh:
    docker-compose exec dummyproject-caddy sh

# open shell in django container
django-sh:
    docker-compose exec dummyproject-django sh

# open shell in postgres container
db-sh:
    docker-compose exec dummyproject-db sh

# docker-compose up -d
start:
    docker-compose up -d

# docker-compose down
stop:
    docker-compose down

alias re := restart
# equivalent to `just stop && just start`
restart:
    docker-compose down && docker-compose up -d

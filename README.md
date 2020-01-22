# Backend project of *Skolteч board*

## Inital start of project
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r req.txt

python manage.py makemigration
python manage.py migrate
```

## Database configuration
```bash
create user skoltech_board_user with password 'passwordQAZSWXDE';
alter role skoltech_board_user set client_encoding to 'utf8';
alter role skoltech_board_user set default_transaction_isolation to 'read committed';
alter role skoltech_board_user set timezone to 'UTC';
create database skoltech_board_db owner skoltech_board_user;
```

## Configure with docker

    cd deployment
    ./run.sh

##### Important node: If you use docker configuration, please use `POSTGRES_USER=postgres`
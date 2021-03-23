# README

## GENERAL INFO

### System dependencies

- Docker & docker-compose
- Heroku CLI

### Docker images

Ruby image: ```ruby:3.0.0```

Postgresql image: ```postgres:13-alpine```

Redis: image ```redis:6-alpine```

Sidekiq: ```6.2.0```

### Configuration .env (template)

```
DATABASE_HOST=db
DATABASE_NAME=app
DATABASE_USER=postgres
DATABASE_PASS=root
```

## DOCKER IN DEVELOPMENT

```bash
docker-compose build
docker-compose up
docker-compose run --rm app bundle install
docker-compose run --rm app yarn
```

## DATABASE
### Database manipulation

```bash
# By hand setup
docker-compose run --rm app bundle exec rails db:drop db:create db:migrate

# db:create db:schema:load db:seed
docker-compose run --rm app bundle exec rails db:setup

# db:drop db:setup
docker-compose run --rm app bundle exec rails db:reset
```

## HEROKU
### Deployment instructions

URL: https://itcrowd-movies.herokuapp.com

```bash
git remote add heroku https://git.heroku.com/itcrowd-movies.git
git push heroku develop:master
```
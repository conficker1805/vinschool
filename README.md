# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# HOW TO DEPLOY
### Push code to Github
### SSH to server
  ssh vinschool
  cd vinschool
### Add code to container
  build
### Run seed
  seed
  dc run web rails db:seed:grade1_math:chapter6_shape_rotation
### Access Rails log
  dc logs -f web
### Access Rails console
  dc run web rails console
### Access Bash
  dc run web bash

### Reset docker
docker-compose down --volumes
docker-compose build --no-cache
docker-compose up -d

### Check/Remove container
docker ps -a
docker rm f99e41eba9a6

docker-compose restart web

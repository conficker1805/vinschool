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

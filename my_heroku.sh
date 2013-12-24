#!/bin/bash
heroku pg:reset DATABASE
heroku run rake db:migrate
heroku run rake db:populate

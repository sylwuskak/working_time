# README

Budget Application

# Installation process

## Install ruby with rbenv

rbenv install 2.5.1
rbenv local 2.5.1

## Install packages
sudo apt-get install libsqlite3-dev libpq-dev nodejs 

## Install bundler
gem install bundler
bundle install

## Setup a database
rake db:create
rake db:migrate

## Run rails and have fun!

rails s

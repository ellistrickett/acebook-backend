[![Build Status](https://travis-ci.org/cjm106/acebook-the-fat-controllers-backend.svg?branch=master)](https://travis-ci.org/github/cjm106/acebook-the-fat-controllers-backend)

# AceBook-the-fat-controllers-backend

Rails API backend for https://github.com/AndrewHulme/acebook-the-fat-controllers

## Technologies used

* Rails
* Simple Command gem
* Bcrypt gem
* Rack-cors gem
* JWT gem

## API Examples

```
## Signup

curl -H "Content-Type: application/json" -X POST -d '{"user": {"email":"email","username":"username","name":"name","password":"12345","password_confirmation":"12345"}}' http://localhost:3000/signup

# example responses:
$ {"username":"username","created_at":"2020-06-07T15:56:58.721Z"}
$ {"email":["has already been taken"],"username":["has already been taken"]}
$ {"password":["can't be blank"]}

## Login

curl -H "Content-Type: application/json" -X POST -d '{"email":"email","password":"12345"}' http://localhost:3000/login

# example responses:
$ {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE2MzEyMjF9.pUlCsEamJgr_HxQl-yFXO_PCjbQcxB1-1xVagWQBoXk"}
$ {"error":{"user_authentication":"invalid credentials"}}

## Posts

curl http://localhost:3000/posts

# example response:
[{"id":1,"user_id":1,"message":"hello,world!","created_at":"2020-06-09T16:09:03.620Z","user":{"username":"freestar92"}},{"id":2,"user_id":2,"message":"hello, mum!","created_at":"2020-06-09T16:18:32.973Z","user":{"username":"swiftactor29"}}]


## New Post

curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE2OTk2NDh9.XtSAuv8VH02C96oHc5uqty01Q6Ics6KralcuoKx-hhM" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"post":{"message":"hello,world!"}}' http://localhost:3000/new

# example responses:
$ {"id":9,"message":"hello,world!","created_at":"2020-06-08T11:43:16.440Z","updated_at":"2020-06-08T11:43:16.440Z"}
$ {"error":"Not Authorized"}


```


## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> rake db:create
> rake db:migrate

> rspec # Run the tests to ensure it works
> rails server # Start the server at localhost:3000
```

# AceBook-the-fat-controllers-backend

Rails API backend

```
##Signup

$ curl -H "Content-Type: application/json" -X POST -d '{"user": {"email":"email","username":"username","name":"name","password":"12345","password_confirmation":"12345"}}' http://localhost:3000/signup

# example responses:
$ {"username":"username","created_at":"2020-06-07T15:56:58.721Z"}
$ {"email":["has already been taken"],"username":["has already been taken"]}
$ {"password":["can't be blank"]}

##Login

$ curl -H "Content-Type: application/json" -X POST -d '{"email":"email","password":"12345"}' http://localhost:3000/login

# example responses:
$ {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE2MzEyMjF9.pUlCsEamJgr_HxQl-yFXO_PCjbQcxB1-1xVagWQBoXk"}
$ {"error":{"user_authentication":"invalid credentials"}}

##Posts

$ curl http://localhost:3000/posts

# example response:
[{"id":1,"message":"hello,world!"},{"id":2,"message":"hello,again!"}]


##New Post

curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE2OTk2NDh9.XtSAuv8VH02C96oHc5uqty01Q6Ics6KralcuoKx-hhM" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"post":{"message":"hello,world!"}}'

# example responses:
$ {"id":9,"message":"hello,world!","created_at":"2020-06-08T11:43:16.440Z","updated_at":"2020-06-08T11:43:16.440Z"}
$ {"error":"Not Authorized"}


```

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

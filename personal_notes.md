# Personal Notes
Quick reference for building important parts of the app

## Using Devise to create users

### Command-line steps
1) rails generate devise:install
2) rails generate devise user
3) rake db:migrate

### User Routes
* GET /users/sign_up

* GET /users/sign_in

* GET /users/sign_out

* GET /users/edit

### Learn Module
Bulletin Board 2: Devise account generator <br>
https://learn.firstdraft.com/lessons/137

## Generating Tables With Scaffolds

### Command-line steps

1) Scaffold comes with rails, no need to install anything
2) rails generate scaffold book title:string description:text released:boolean... \<column_name\>:\<type\>
3) rake db:migrate

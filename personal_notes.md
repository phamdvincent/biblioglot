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

### Adding column to table

* rails g migration AddCToBooks c:date

### Learn Module
Getting started with scaffolds <br>
https://learn.firstdraft.com/lessons/158-getting-started-with-scaffolds


## Install Stanza for NLP on Ubuntu

### Command-line steps
1) sudo apt update
1) sudo apt install python3-pip
3) pip3 install stanza

### Documentation
https://stanfordnlp.github.io/stanza/index.html#getting-started

## AWS Services

* Lambda
* EC2
* S3
* DynamoDB
* Polly
* IAM

### EC2
* https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html#ec2-get-started-overview
* https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html

### IAM
* Create IAM users and groups
  - https://docs.aws.amazon.com/singlesignon/latest/userguide/quick-start-default-idc.html

### Lambda
* https://docs.aws.amazon.com/lambda/latest/dg/getting-started.html

### S3
* https://aws.amazon.com/s3/getting-started/

### Polly
* https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/polly-example-synthesize-speech.html

1) Create AWS account
2) Set up IAM for authorizations

## Launching with Fly.io

* NameError is an error in naming conventions ('services' in app)

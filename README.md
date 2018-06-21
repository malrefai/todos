## Todos App  

[![Build Status](https://travis-ci.org/malrefai/todos.svg?branch=develop)](https://travis-ci.org/malrefai/todos)
[![Coverage Status](https://coveralls.io/repos/github/malrefai/todos/badge.svg)](https://coveralls.io/github/malrefai/todos)
[![Maintainability](https://api.codeclimate.com/v1/badges/37609c390a1a9f602cab/maintainability)](https://codeclimate.com/github/malrefai/todos/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/37609c390a1a9f602cab/test_coverage)](https://codeclimate.com/github/malrefai/todos/test_coverage)
[![codebeat badge](https://codebeat.co/badges/a5ab411e-22b3-484f-9df9-75ff6cb4345b)](https://codebeat.co/projects/github-com-malrefai-todos-develop) 
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fmalrefai%2Ftodos.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fmalrefai%2Ftodos?ref=badge_shield) 


This is just a simple ..     

## Technology Stack

- [RVM][0]
- [Ruby 2.4.2][1]
- [Ruby on Rails 5.1.4][2]
- [MongoDB][3]

## Installation Guide

### 1. Install [RVM][0]
    $ curl -sSL https://get.rvm.io | bash -s stable --ruby

### 2. Install [Ruby 2.4.2][1]
    $ rvm install 2.4.2
    
### 3. Fork then clone the repository
Fork repository to your github account

	$ git clone git@github.com:<GITHUB_ACCOUNT>/todos.git <YOUR_PROJECT_DIR>
	$ cd <YOUR_PROJECT_DIR>
	
### 4. Create new gemset and use it
    $ rvm use 2.4.2@todos --create --ruby-version
    
### 5. Install bundle
    $ gem install bundle

### 6. Install dependencies
On the project root there is a Gemfile file.  
Make sure you install all the required dependencies before running app.  

    $ bundle install
    
### 7. Seeds database
    $ ....
    
### 8. Run App
    $ rails server -P3000

## Demo  
[Todos https://www][4]
	
## Notes
The app

## Copyright
Copyright (c) 2018 Mohammad Alrefai. See LICENSE.txt for further details.

## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fmalrefai%2Ftodos.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fmalrefai%2Ftodos?ref=badge_large)

[0]: https://rvm.io/
[1]: https://www.ruby-lang.org/
[2]: http://rubyonrails.org/
[3]: https://www.mongodb.com/
[4]: https://www

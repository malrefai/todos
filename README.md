## Todos App  

[![Build Status](https://travis-ci.org/malrefai/todos.svg?branch=develop)](https://travis-ci.org/malrefai/todos)
[![Coverage Status](https://coveralls.io/repos/github/malrefai/todos/badge.svg)](https://coveralls.io/github/malrefai/todos)  


This is just a simple ..     

## Technology Stack

- [RVM][0]
- [Ruby 2.4.2][1]
- [Ruby on Rails 5.1.4][2]
- [NVM][3]
- [NodeJs 9.4.0][4]
- [ReactJs][5] 
- [MongoDB][6]
- [Travis CI][7]
- [Heroku][8]

## Installation Guide

### 1. Install [RVM][0]
    $ curl -sSL https://get.rvm.io | bash -s stable --ruby

### 2. Install [Ruby 2.4.2][1]
    $ rvm install 2.4.2
    
### 3. Create new gemset and use it
    $ rvm use 2.4.2@todos-api --create
    
### 4. Clone the repository
	$ git clone git@github.com:malrefai/todos-api.git <YOUR_PROJECT_DIR>
	$ cd <YOUR_PROJECT_DIR>
	
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
[Todos https://www][9]
	
## Notes
The app

## Copyright
Copyright (c) 2018 Moh'd Alrefai. See LICENSE.txt for further details.


[0]: https://rvm.io/
[1]: https://www.ruby-lang.org/
[2]: http://rubyonrails.org/
[3]: https://github.com/creationix/nvm
[4]: https://nodejs.org/
[5]: https://reactjs.org/
[6]: https://www.mongodb.com/
[7]: https://travis-ci.org/
[8]: https://www.heroku.com/
[9]: https://www

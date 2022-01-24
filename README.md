# README

This is Steve Cho's Implementation.
Please contact me at 416-669-6609 or iamstevecho@gmail.com


## Overview of my design decisions
  There is a command line script that initiates application.

  CardProcessorService takes input and delegates each line of command to CommandProcessor.
  The CommandProcessor will invoke different transaction handlers based on command type.
  Main motivation is single responsibility based design and ease of test.
  
  
![Blank diagram](https://user-images.githubusercontent.com/63982/150863953-a84e00ea-36ad-4d4e-b220-d5459fb8f40b.png)

## How to install any required dependencies
  This project requires Ruby 3.0.3 version and Rails 7.0.0 version.
  Please download source code to your local computer or do git clone.
  Then change directory to the project root directory, then run following commands.

  ```bash
  $ bundle install
  $ rails db:create; rails db:migrate
  ```

## How to run
  Run the following command from the project root.
  ```bash
  $ rails runner card_processor.rb < PATH_TO_INPUT_FILE

  e.g) rails runner card_processor.rb < spec/fixtures/card_input.txt
  ```


  At every run card_processor.rb **resets related database tables for demo purpose.**
  If you want to run the application without resetting data please remove following lines from card_processor.rb

  ```bash
  CardTransaction.destroy_all
  CreditCard.destroy_all
  ```

## How to test
  ```bash
  $ RAILS_ENV=test rails db:migrate
  $ rspec
  ```

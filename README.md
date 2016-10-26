# ShiftPlanning

A gem for interfacing with the [Shift Planning API](https://www.shiftplanning.com/api/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shiftplanning', git: "git://github.com/morganmiller/shiftplanning.git"
```

And then execute:

    $ bundle install

To ensure the latest version on master branch, execute:

    $ bundle update shiftplanning

## Usage

TODO: Make better
```ruby

#To initialize Client
key      = 'myshiftplanningapikey'
username = 'shiftplanningun'
password = 'shiftplanningpw'
client   = ShiftPlanning::Client.new(key, username, password)

#To pull shifts from a certain date range
data = { start_date: 'Aug 1, 2016', end_date: 'Aug 30, 2016' }
client.shifts(data)
```

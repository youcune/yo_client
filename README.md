# YoClient

is a Ruby client of [Yo](http://www.justyo.co/).
[![Build Status](https://travis-ci.org/youcune/yo_client.svg?branch=master)](https://travis-ci.org/youcune/yo_client)
[![Coverage Status](https://coveralls.io/repos/youcune/yo_client/badge.png)](https://coveralls.io/r/youcune/yo_client)

## Requirements

* Ruby 1.9+ (Tested on Ruby 1.9.3, 2.0.0, 2.1.2)
* [Yo API Account](http://dev.justyo.co/)

## Installation

Add this line to your application's Gemfile:

```
gem 'yo_client', github: 'youcune/yo_client'
```

And then execute:

```
$ bundle
```

## Usage

```
client = YoClient::Client.new(API_TOKEN)

# Send A Yo To All Subscribers
client.yoall

# Yo Individual Usernames
# Note that USERNAME will be upcased and sent to API
client.yo(USERNAME)

# Count Total Subscribers
client.subscribers_count # -> 5
```

## Contributing

1. Fork it ( https://github.com/youcune/yo_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


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
gem 'yo_client'
```

And then execute:

```
$ bundle install
```

## Usage

```
client = YoClient::Client.new(API_TOKEN)

# Yo all subscribers
client.yoall

# Yo specific user
# Note that USERNAME will be upcased before sending to API
client.yo(USERNAME)

# Count Total Subscribers
client.subscribers_count # -> 5
```

### Error Handling

* `YoClient::ConnectionError` is risen if the connection has failed.
* `YoClient::ClientError` is risen if the connection has succeeded but API returned error.

At the date of 13th July, even if API results in failure, it sometimes behaves as if it succeed. In this case, YoClient cannot tell succeeded or not.

## Contributing

1. Fork it ( https://github.com/youcune/yo_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Yo the author

[Yo YOUCUNE](http://justyo.co/YOUCUNE), author of YoClient, if you ...

* like YoClient
* dislike YoClient
* have any ideas about YoClient

Thanks.

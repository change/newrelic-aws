# NewRelic for Ruby AWS-SDK

Unofficial [NewRelic](http://newrelic.com/) instrumentation for the [official AWS SDK](http://aws.amazon.com/sdkforruby/).

At present, this is an embryonic set of instrumentation focussing primarily on the underlying client
and S3 functionality plus a little bit of SQS and Simple Email Service. Pull requests are welcome!

## Installation

Add this line to your application's Gemfile:

    gem 'newrelic-aws'

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install newrelic-aws

If you're having trouble with NewRelic attepmting to instrument the old `AWS::S3` [gem](https://github.com/marcel/aws-s3)
(the one not created by Amazon that is mostly unmaintained) you may want to add `disable_aws-s3: true` to your `newrelic.yml`
configuration. NewRelic has this intrumentation built-in, and it may complain since Amazon's SDK uses the same namespace but
a different class structure.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

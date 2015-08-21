# Virtus::Localized

[![Build Status][travis-image]][travis-url]

Virtus::Localized is an extension for [virtus][travis-url] that adds the `localized` feature. It's based on the `localized` feature of [MongoID][mongoID-url] and was requested via this [issue][issue-url]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'virtus-localized'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install virtus-localized

## Usage

You need to require it first:

```ruby
  require 'virtus/localized'
```

Then it gives you the following flag when definig the `attribute`:

```ruby
  class Post
    include Virtus.model

    attribute :title, String, localized: true
    attribute :body, String, localized: true
  end

```

It uses the [i18n](https://github.com/svenfuchs/i18n) to detect the `locale` and creates an internal hash for the attribute:

```ruby
  post = Post.new(title: 'Hello', body: 'English')

  p post.title
  # => 'Hello'

  p post.body
  # => 'English'

  I18n.locale = :es

  post.title = 'Hola'
  post.body = 'Español'

  p post.title
  # => 'Hola'

  p post.body
  # => 'Español'

  p post.instance_variable_get('@title')
  # { "en" => "Hello", "es" => "Hola" }

  p post.instance_variable_get('@body')
  # { "en" => "English", "es" => "Español" }

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/virtus-localized/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

[MIT](LICENSE)

[travis-image]: https://travis-ci.org/XescuGC/virtus-localized.svg?branch=master
[travis-url]: https://travis-ci.org/XescuGC/virtus-localized
[virtus-url]: https://github.com/solnic/virtus
[mongoID-url]: https://travis-ci.org/XescuGC/virtus-localized
[issue-url]: https://travis-ci.org/XescuGC/virtus-localized


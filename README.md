[![Code Climate](https://codeclimate.com/github/Lackoftactics/dirble/badges/gpa.svg)](https://codeclimate.com/github/Lackoftactics/dirble)
[![Build Status](https://travis-ci.org/Lackoftactics/dirble.svg?branch=master)](https://travis-ci.org/Lackoftactics/dirble)
# Dirble

Gem to make interacting with http://api.dirble.com/ amazingly easy.
Using familiar Rails syntax.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dirble'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dirble

## Usage

In Rails: Put this quick configuration block in environment file.
Beyond Rails: Put this in initialization or config file.
```ruby
Dirble.configure do |config|
  config.api_key = "valid_api_key_from_dirble"
end
```
Now you are ready to go and able to make amazing things like
## Category
Fetch all categories with `Dirble::Category.all`\n
Fetch primary categories with `Dirble::Category.primary` or
`Dirble::PrimaryCategory.all`\n
Find category by id `Dirble::Category.find(2)`\n
Get first category `Dirble::Category.first`\n

Find children of primary category
```ruby
  primary_category = Dirble::PrimaryCategory.first
  children = primary_category.children
```

Find stations of category `category.stations`


## Contributing

1. Fork it ( https://github.com/[my-github-username]/dirble/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

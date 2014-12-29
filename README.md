[![Code Climate](https://codeclimate.com/github/Lackoftactics/dirble/badges/gpa.svg)](https://codeclimate.com/github/Lackoftactics/dirble)
[![Build Status](https://travis-ci.org/Lackoftactics/dirble.svg?branch=master)](https://travis-ci.org/Lackoftactics/dirble)
[![Coverage Status](https://coveralls.io/repos/Lackoftactics/dirble/badge.png?branch=master)](https://coveralls.io/r/Lackoftactics/dirble?branch=master)
# Dirble

Gem to make interacting with http://api.dirble.com/ amazingly easy.
Using familiar Rails syntax. It uses Faraday and Typhoeus as adapter.

## Compatibility

* Ruby 1.9.3 and 2
* Rubinius

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
Now you are ready to go.
## Category
* Fetch all categories with

  `Dirble::Category.all`

* Fetch primary categories with

  `Dirble::Category.primary` or
  `Dirble::PrimaryCategory.all`

* Find category by id

  `Dirble::Category.find(2)`

* Get first category

  `Dirble::Category.first`

* Find children of primary category

```ruby
  primary_category = Dirble::PrimaryCategory.first
  children = primary_category.children
```

* Find stations of category

  `category.stations`

* Category details

```ruby
  category.id
  category.name
  category.description
```

## Station

* Search stations

  `Dirble::Station.search('pop')`

* Stations by continent

  `Dirble::Station.by_continent('Asia')`

* Stations by country using iso code

  `Dirble::Station.by_country('us')`

* Stations by country name

  `Dirbel::Station.by_country_name('United States')`

* Stations amount. Check currently registered stations in Dirble.

  `Dirble::Station.count`

* Find station by id

  `Dirble::Station.find(100)`

* Adding new station to directory (website, name and directory are
  required fields)

```ruby
      params_for_creation = {
        name: 'New station',
        website: 'www.new-station.com',
        directory: 'Pop'
      }
      Dirble::Station.create(params_for_creation)
```

* Station details

```ruby
station.name
station.website
station.bitrate
station.directory
station.description
station.stream_url
station.status
```
* Accessing song history by station, information available only after
  `Dirble::Station.find(id)`

  `station.song_history`

## Song

Songs in song history have many interesting informations.

* Name and title

  `song.name`
  `song.title`

* Spotify url

  `song.spotify_url`

* When last played on particular station

  `song.played_on`

## Coming features

* Add parallel connections with Typhoeus

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dirble/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

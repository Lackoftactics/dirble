module Dirble
  class Song
    attr_accessor :id, :image_url, :name, :title, :spotify_url, :played_on, :raw

    def initialize
      yield self
    end

    def info
      Hash(raw.fetch('info'))
    end

    def fetch_id
      raw.fetch('_id', {}).fetch('$id', nil)
    end

    def fetch_image_url
      info.fetch('image', nil)
    end

    def fetch_name
      raw.fetch('name', nil)
    end

    def fetch_title
      raw.fetch('title', nil)
    end

    def fetch_spotify_url
      info.fetch('urls', {}).fetch('spotify', nil)
    end

    def date
      raw.fetch('date', {})
    end

    def fetch_played_on
      Time.at(date['sec'])
    end

    class << self
      def factory(list_of_songs)
        list_of_songs.each do |song|
          build_song(song)
        end
      end

      private

      def build_song(song_params)
        new do |song|
          song.raw = song_params
          song.id = fetch_id
          song.image_url = fetch_image_url
          song.name = fetch_name
          song.title = fetch_title
          song.spotify_url = fetch_spotify_url
          song.played_on = fetch_played_on
        end
      end
    end
  end
end

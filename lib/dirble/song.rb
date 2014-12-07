module Dirble
  class Song
    attr_accessor :id, :image_url, :name, :title, :spotify_url, :played_on, :raw

    def info
      raw.fetch('info') || {}
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
        list_of_songs.map do |song|
          build_song(song)
        end
      end

      private

      def build_song(song_params)
        new_song = self.new
        new_song.instance_eval do
          self.raw = song_params
          self.id = fetch_id
          self.image_url = fetch_image_url
          self.name = fetch_name
          self.title = fetch_title
          self.spotify_url = fetch_spotify_url
          self.played_on = fetch_played_on
        end
        new_song
      end
    end
  end
end

require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/namespace'

class FakeDirbleApi < Sinatra::Base
  helpers Sinatra::JSON
  register Sinatra::Namespace

  namespace '/v1' do
    get '/categories/apikey/:apikey' do
      json_response 200, 'categories.json'
    end

    get '/primaryCategories/apikey/:apikey' do
      json_response 200, 'primary_categories.json'
    end

    get '/childCategories/apikey/:apikey/primaryid/:primary_category_id' do
      json_response 200, 'child_categories.json'
    end

    get '/stations/apikey/:apikey/id/:category_id' do
      json_response 200, 'stations_in_category.json'
    end

    get '/search/apikey/:apikey/search/:searched_text' do
      json_response 200, 'search_stations_general.json'
    end

    get '/search/apikey/:apikey/search/:searched_text/genre/:genre_name/from/:page/count/:per_page' do
      # add json response for filtered search
    end

    get '/continent/apikey/:apikey/continent/:continent' do
      json_response 200, 'stations_continent_asia.json'
    end

    get '/country/apikey/:apikey/country/:country_code' do
      json_response 200, 'stations_for_country_usa.json'
    end

    get '/station/apikey/:apikey/id/:station_id' do
      json_response 200, 'station.json'
    end

    post '/station/apikey/:apikey' do
      content_type :json
      create_station_response = { name: params[:name], website: params[:website], directory: params[:directory] }
      if %w{name website directory}.all? { |field| params.keys.include?(field) }
        status 200
        json create_station_response.merge(status: 1)
      else
        status 422
        json create_station_response.merge(status: 0)
      end
    end

    get '/amountStation/apikey/:apikey' do
      json_response 200, 'stations_count.json'
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end

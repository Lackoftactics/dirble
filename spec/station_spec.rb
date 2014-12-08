require 'spec_helper'

describe Dirble::Station do
  before do
    configure_dirble
  end

  context 'search' do
    it 'returns search results' do
      station = Dirble::Station.search('funk').first
      expect(station.name).to eq('181.fm  Jammin 181')
    end

    it 'returns station filtered by continent' do
      station = Dirble::Station.by_continent('Asia').first
      expect(station.name).to eq('Lounge Beats')
    end

    it 'returns station filtered by country using iso code' do
      station = Dirble::Station.by_country('us').first
      expect(station.country).to eq('US')
    end

    it 'returns station filtered by country name' do
      station = Dirble::Station.by_country_name('United States').first
      expect(station.country).to eq('US')
    end
   end

  context 'station with details' do
    let!(:station) { Dirble::Station.find(100) }

    it 'gets individual station with detailed info' do
      expect([station.bitrate, station.website, station.id]).to eq(['128', 'http://radio252.fm', '11717'])
    end

    it 'owns song history' do
      station = Dirble::Station.find(100)
      #expect(station.song_history).to_not be_empty
      expect(station.song_history.first.name).to eq('Blackfoot')
    end
  end

  context 'create' do
    it 'creates station with status 1 when valid params' do
      params_for_creation = {
        name: 'New station',
        website: 'www.new-station.com',
        directory: 'Pop'
      }
      station = Dirble::Station.create(params_for_creation)
      expect(station.status).to eq(1)
    end
  end

  context 'amount of station' do
    it 'gets number of currently registered stations' do
      expect(Dirble::Station.count).to eq(4502)
    end
  end
end

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
   end

  context 'station with details' do
    it 'gets individual station' do

    end
  end

  context 'amount of station' do
    it 'gets number of currently registered stations' do
      expect(Dirble::Station.count).to eq(4502)
    end
  end
end

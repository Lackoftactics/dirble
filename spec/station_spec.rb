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
   end

  context 'station with details' do
    it 'gets individual station' do

    end
  end
end

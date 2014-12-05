require 'spec_helper'

describe Dirble::Category do
  before do
    configure_dirble
  end

  let!(:category) { Dirble::Category.first }

  it 'returns all categories' do
    expect(Dirble::Category.all.count).to eq(65)
  end

  it 'returns primary categories' do
    primary_categories = Dirble::Category.primary
    expect(primary_categories.count).to eq(14)
    expect(primary_categories.first.class).to eq(Dirble::PrimaryCategory)
  end

  it 'finds category by id' do
    category = Dirble::Category.find(2)
    expect(category.name).to eq('Rock')
  end

  it 'gets first category' do
    category = Dirble::Category.first
    expect(category.name).to eq('40s')
  end

  it 'has primary flag set to false' do
    expect(category.primary).to eq(false)
  end

  context 'stations' do
    it 'gets stations in category' do
      expect(category.stations).to_not be_empty
    end

    it 'gets station with data' do
      station = category.stations.first
      expect(station.name).to eq('Radio Forever')
    end
  end
end

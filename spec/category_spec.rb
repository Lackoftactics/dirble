require 'spec_helper'

describe Dirble::Category do
  before do
    Dirble.configure do |config|
      config.api_key = "valid_api_key"
    end
  end

  it 'returns all categories' do
    expect(Dirble::Category.all.count).to eq(65)
  end

  it 'returns primary categories' do
    expect(Dirble::Category.primary.count).to eq(14)
  end

  it 'finds category by id' do
    category = Dirble::Category.find(2)
    expect(category.name).to eq('Rock')
  end

  it 'gets first category' do
    category = Dirble::Category.first
    expect(category.name).to eq('40s')
  end
end

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
end

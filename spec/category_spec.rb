require 'spec_helper'

describe Dirble::Category do

  it 'returns all categories' do
    expect(Dirble::Category.all.count).to eq(200)
  end

  it 'returns primary categories' do
    expect(Dirble::Category.primary.count).to eq(10)
  end
end

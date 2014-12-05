require 'spec_helper'

describe Dirble::Category do
  before do
    configure_dirble
  end

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
end

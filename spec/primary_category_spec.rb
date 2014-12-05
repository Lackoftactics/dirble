require 'spec_helper'

describe Dirble::PrimaryCategory do
  before do
    configure_dirble
  end

  it 'get all primary categories' do
    expect(Dirble::PrimaryCategory.all.count).to eq(14)
  end

  it 'get children of primary category' do
    pop_primary_category = Dirble::PrimaryCategory.find(5)
    expect(pop_primary_category.children.map(&:name)).to include("JPOP", "KPop")
  end
end

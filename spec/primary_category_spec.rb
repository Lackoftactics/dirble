require 'spec_helper'

describe Dirble::PrimaryCategory do
  before do
    configure_dirble
  end

  let!(:primary_category) { Dirble::PrimaryCategory.find(5) }

  it 'get all primary categories' do
    expect(Dirble::PrimaryCategory.all.count).to eq(14)
  end

  it 'get children of primary category' do
    expect(primary_category.children.map(&:name)).to include("JPOP", "KPop")
  end

  it 'have primary flag set to true' do
    expect(primary_category.primary).to eq(true)
  end
end

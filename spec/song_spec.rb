require 'spec_helper'

describe Dirble::Song do
  let!(:station) { Dirble::Station.find(100) }
  let!(:song)    { station.song_history.first }

  it 'has name' do
    expect(song.name).to eq('Blackfoot')
  end

  it 'has title' do
    expect(song.title).to eq('Run and Hide')
  end

  it 'has spotify url' do
    expect(song.spotify_url).to eq('spotify:track:3JLeD2XmrU6jowD14OTw85')
  end

  it 'has raw info' do
    expect(song.raw).to_not be_empty
  end

  it 'has played on information, when' do
    expect(song.played_on).to be_instance_of(Time)
  end
end

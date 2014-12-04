require 'spec_helper'

describe Dirble do
  context 'configure' do
    let(:dirble_with_key)     { Dirble.configure { |config| config.api_key = 'api_key' } }

    it 'returns self when supplied with api key' do
      expect(dirble_with_key).to eq(Dirble)
    end

    it 'raises argument error when no api key' do
      Dirble.reset!
      expect { Dirble.configure { |config| } }.to raise_error(ArgumentError)
    end
  end
end

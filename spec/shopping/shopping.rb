require 'rails_helper'

describe Shopping do

  describe '#configure' do
    before do
      Shopping.configure do |config|
        @config = config
      end
    end

    it 'configures the engine' do
      expect(@config).to be_a(Shopping::Config)
    end
  end
  
  describe '#logger(logger=nil)' do
    let(:config){ Shopping::Config.new }

    context 'with an argument' do
      it 'sets the logger' do
        logger = Logger.new(STDOUT)
        config.logger logger
        expect(config.logger).to eq(logger)
      end
    end

    context 'without an argument' do
      it 'returns nil' do
        expect(config.logger).to be_nil
      end
    end  
  end

end

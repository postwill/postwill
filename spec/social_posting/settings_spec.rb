describe SocialPosting::Settings do
  describe 'providers configs' do
    it 'should returns empty hash if credentials empty' do
      expect(SocialPosting::Settings.config.providers.twitter).to eq({})
    end

    describe 'with defined credentials' do
      let(:provider) { SocialPosting::Settings.config.providers.twitter }
      let(:key) { FFaker::DizzleIpsum.characters(10) }
      let(:secret) { FFaker::DizzleIpsum.characters(10) }

      before do
        SocialPosting::Settings.configure do |config|
          config.providers.twitter = {
            consumer_key: key,
            consumer_secret: secret
          }
        end
      end

      it 'should returns defined credentials' do
        expect(provider[:consumer_key]).to eq key
        expect(provider[:consumer_secret]).to eq secret
      end
    end
  end
end

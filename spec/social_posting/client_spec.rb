describe SocialPosting::Client do
  let(:data) do
    {
      twitter: { access_token: FFaker::IdentificationMX.curp,
                 access_token_secret: FFaker::IdentificationMX.curp},
      facebook: { access_token: FFaker::IdentificationMX.curp }
    }
  end

  subject { SocialPosting::Client }

  describe '#to' do
    context 'single provider' do
      it 'should returns :ok' do
        VCR.use_cassette('twitter_valid') do
          social_posting = subject.new(data)
          response = social_posting.to(:twitter, 'text')

          expect(response[0][:twitter][:status]).to eq :ok
        end
      end

      it 'should returns :error' do
        VCR.use_cassette('twitter_invalid') do
          social_posting = subject.new(data)
          response = social_posting.to(:twitter, 'text')

          expect(response[0][:twitter][:status]).to eq :error
        end
      end
    end
  end

  describe 'instance_providers' do
    let(:client) { subject.new(data) }

    it 'should assign instance variable for each provider' do
      client.send(:instance_providers, data)

      expect(client.instance_variable_get(:@twitter)).to be_a_kind_of(SocialPosting::Providers::Twitter)
      expect(client.instance_variable_get(:@facebook)).to be_a_kind_of(SocialPosting::Providers::Facebook)
    end
  end
end

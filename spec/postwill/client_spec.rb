describe Postwill::Client do
  let(:data) do
    {
      twitter: { access_token: FFaker::IdentificationMX.curp, access_token_secret: FFaker::IdentificationMX.curp },
      facebook: { access_token: FFaker::IdentificationMX.curp }
    }
  end

  subject { Postwill::Client }

  describe '#to' do
    context 'single provider' do
      it 'should returns :ok' do
        VCR.use_cassette('twitter_valid') do
          postwill = subject.new(data)
          response = postwill.to(:twitter, text: 'text')

          expect(response[:twitter][:status]).to eq :ok
        end
      end

      it 'should returns :error' do
        VCR.use_cassette('twitter_invalid') do
          postwill = subject.new(data)
          response = postwill.to(:twitter, text: 'text')

          expect(response[:twitter][:status]).to eq :error
        end
      end
    end

    context 'multiple providers' do
      it 'everything is fine' do
        VCR.use_cassette('twitter_valid') do
          VCR.use_cassette('facebook_valid') do
            postwill = subject.new(data)
            response = postwill.to(%i[twitter facebook], text: 'text')

            expect(response[:twitter][:status]).to eq :ok
            expect(response[:facebook][:status]).to eq :ok
          end
        end
      end

      it 'one of providers is failed' do
        VCR.use_cassette('twitter_valid') do
          VCR.use_cassette('facebook_invalid') do
            postwill = subject.new(data)
            response = postwill.to(%i[twitter facebook], text: 'text')

            expect(response[:twitter][:status]).to eq :ok
            expect(response[:facebook][:status]).to eq :error
          end
        end
      end
    end
  end

  describe 'instance_providers' do
    let(:client) { subject.new(data) }

    it 'should assign instance variable for each provider' do
      client.send(:instance_providers, data)

      expect(client.instance_variable_get(:@twitter)).to be_a_kind_of(Postwill::Providers::Twitter)
      expect(client.instance_variable_get(:@facebook)).to be_a_kind_of(Postwill::Providers::Facebook)
    end
  end
end

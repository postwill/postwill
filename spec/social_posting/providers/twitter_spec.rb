describe SocialPosting::Providers::Twitter do
  subject { SocialPosting::Providers::Twitter.new(access_token: FFaker::IdentificationMX.curp,
                                                  access_token_secret: FFaker::IdentificationMX.curp) }

  describe '#call' do
    before do
      allow(SocialPosting::Settings).to receive_message_chain(:config, :providers, :twitter).and_return({consumer_key: FFaker::IdentificationMX.curp,
                                                                                                         consumer_secret: FFaker::IdentificationMX.curp})
    end

    context 'if everything is ok' do
      it 'should returns right monad' do
        VCR.use_cassette('twitter_valid') do
          expect(subject.call('test api explorer').right?).to be_truthy
        end
      end

      it 'should have it key' do
        VCR.use_cassette('twitter_valid') do
          expect(subject.call('test api explorer').value.has_key?(:id)).to be_truthy
        end
      end
    end

    context 'if something went wrong' do
      it 'should returns left monad' do
        VCR.use_cassette('twitter_invalid') do
          expect(subject.call('hello').left?).to be_truthy
        end
      end

      it 'should be a Twitter::Error::Unauthorized instance' do
        VCR.use_cassette('twitter_invalid') do
          expect(subject.call('hello').value).to be_a_kind_of(Twitter::Error::Unauthorized)
        end
      end
    end
  end
end

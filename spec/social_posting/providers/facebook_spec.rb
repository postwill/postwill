describe SocialPosting::Providers::Facebook do
  subject { SocialPosting::Providers::Facebook.new(access_token: FFaker::IdentificationMX.curp) }

  describe '#call' do
    context 'if everything is ok' do
      it 'should returns right monad' do
        VCR.use_cassette('facebook_valid') do
          expect(subject.call('test api explorer').right?).to be_truthy
        end
      end

      it 'should have it key' do
        VCR.use_cassette('facebook_valid') do
          expect(subject.call('test api explorer').value.has_key?('id')).to be_truthy
        end
      end
    end

    context 'if something went wrong' do
      it 'should returns left monad' do
        VCR.use_cassette('facebook_invalid') do
          expect(subject.call('hello').left?).to be_truthy
        end
      end

      it 'should be a Koala::Facebook::AuthenticationError instance' do
        VCR.use_cassette('facebook_invalid') do
          expect(subject.call('hello').value).to be_a_kind_of(Koala::Facebook::ClientError)
        end
      end
    end
  end
end

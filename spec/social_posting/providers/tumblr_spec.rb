describe SocialPosting::Providers::Tumblr do
  subject do
    SocialPosting::Providers::Tumblr.new(access_token: FFaker::IdentificationMX.curp,
                                         access_token_secret: FFaker::IdentificationMX.curp)
  end

  let(:text) { 'test api explorer' }
  let(:image) { 'test.jpg' }
  let(:user) { 'usernickname' }

  describe '#call' do
    context 'if everything is ok' do
      it 'should returns right monad' do
        VCR.use_cassette('tumblr_valid') do
          expect(subject.call(user: user, text: text, image: image).right?).to be_truthy
        end
      end

      it 'should have it key' do
        VCR.use_cassette('tumblr_valid') do
          expect(subject.call(user: user, text: text, image: image).value.dig('id')).not_to be_nil
        end
      end
    end

    context 'if something went wrong' do
      it 'should returns left monad' do
        VCR.use_cassette('tumblr_invalid') do
          expect(subject.call(user: user).left?).to be_truthy
        end
      end
    end
  end
end

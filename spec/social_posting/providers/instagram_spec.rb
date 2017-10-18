describe SocialPosting::Providers::Instagram do
  subject do
    SocialPosting::Providers::Instagram.new(username: FFaker::IdentificationMX.curp, password: FFaker::IdentificationMX.curp)
  end

  let(:text) { 'test api explorer' }
  let(:image) { 'test.jpg' }

  describe '#call' do
    context 'if everything is ok' do
      it 'should returns right monad' do
        VCR.use_cassette('instagram_valid') do
          expect(subject.call(image: image, text: text).right?).to be_truthy
        end
      end

      it 'should have it key' do
        VCR.use_cassette('instagram_valid') do
          expect(subject.call(image: image, text: text).value.key?('media')).to be_truthy
        end
      end
    end

    context 'if something went wrong' do
      it 'should returns left monad' do
        VCR.use_cassette('instagram_invalid') do
          expect(subject.call(text: text).left?).to be_truthy
        end
      end
    end
  end
end

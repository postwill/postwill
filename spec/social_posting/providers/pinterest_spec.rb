describe SocialPosting::Providers::Facebook do
  subject { SocialPosting::Providers::Pinterest.new(access_token: FFaker::IdentificationMX.curp) }
  let(:image_url) { FFaker::Avatar.image }
  let(:board_id) { FFaker::IdentificationMX.curp }

  describe '#call' do
    context 'if everything is ok' do
      it 'should returns right monad' do
        VCR.use_cassette('pinterest_valid') do
          expect(subject.call(board_id: board_id, text: 'test api explorer', image_url: image_url).right?).to be_truthy
        end
      end

      it 'should have it key' do
        VCR.use_cassette('pinterest_valid') do
          expect(subject.call(board_id: board_id, text: 'test api explorer', image_url: image_url).value.dig('data', 'id')).not_to be_nil
        end
      end
    end

    context 'if something went wrong' do
      it 'should returns left monad' do
        VCR.use_cassette('pinterest_invalid') do
          expect(subject.call(text: 'hello', image_url: image_url).left?).to be_truthy
        end
      end
    end
  end
end

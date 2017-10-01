describe SocialPosting::Response do
  subject { SocialPosting::Response }

  describe '.call' do
    it 'should return response hash' do
      expect(subject.call('twitter', :ok, {})).to eq({
                                                       twitter: {
                                                         status: :ok, response: {}
                                                       }
                                                     })
    end
  end
end

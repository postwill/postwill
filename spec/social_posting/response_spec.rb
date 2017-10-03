describe SocialPosting::Response do
  describe '.call' do
    it 'should return response hash' do
      expect(described_class.call('twitter', :ok, {})).to eq({
                                                       twitter: {
                                                         status: :ok, response: {}
                                                       }
                                                     })
    end
  end
end

describe Postwill::Response do
  describe '.call' do
    it 'should return response hash' do
      expect(described_class.call(:ok, {})).to eq(status: :ok, response: {})
    end
  end
end

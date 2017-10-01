describe SocialPosting::Providers::Base do
  describe '#call' do
    it 'should returns left monad' do
      response = subject.call
      expect(response.left?).to be_truthy
    end
  end

  describe 'post' do
    it 'should be template method' do
      expect{ subject.send(:post, nil, nil) }.to raise_error 'NotImplementedError'
    end
  end
end

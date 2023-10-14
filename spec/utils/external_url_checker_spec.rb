describe ExternalUrlChecker do
  subject(:checker) { described_class.new(url) }

  context 'for a valid external urls' do
    it 'returns the url' do
      expect(
        described_class.new('https://example.com/image.jpg').check!
      ).to eq('https://example.com/image.jpg')

      expect(
        described_class.new('http://example.com/image.jpg').check!
      ).to eq('http://example.com/image.jpg')
    end
  end

  context 'for a invalid schema' do
    let(:url) { 'ftp://example.com/image.jpg' }

    it 'raises an error' do
      expect { checker.check! }.to raise_error(ExternalUrlChecker::Error, "Forbidden Schema: #{url}")
    end
  end

  context 'for a private IPv4 address' do
    let(:url) { 'http://10.0.0.1' }

    it 'raises an error' do
      expect { checker.check! }.to raise_error(ExternalUrlChecker::Error, "Forbidden IP: #{url}")
    end
  end

  context 'for a private IPv6 address' do
    let(:url) { 'http://[fd00::1]' }

    it 'raises an error' do
      expect { checker.check! }.to raise_error(ExternalUrlChecker::Error, "Forbidden IP: #{url}")
    end
  end

  context 'for a localhost address' do
    let(:url) { 'http://localhost/foo.jpg' }

    it 'raises an error' do
      expect { checker.check! }.to raise_error(ExternalUrlChecker::Error, "Forbidden hostname: #{url}")
    end
  end

  context 'for a forbidden port' do
    let(:url) { 'http://example.org:123/foo.jpg' }

    it 'raises an error' do
      expect { checker.check! }.to raise_error(ExternalUrlChecker::Error, "Forbidden Port: #{url}")
    end
  end

  context 'for a invalid url' do
    let(:url) { '\invalid//123123:)' }

    it 'raises an error' do
      expect { checker.check! }.to raise_error(ExternalUrlChecker::Error, "Invalid URL: #{url}")
    end
  end
end

describe DomainNormalizer do
  subject(:normalizer) { described_class }

  it 'normalizes domain' do
    expect(normalizer.new('https://example.example.com').to_s).to eql('example.example.com')
    expect(normalizer.new('https://Example.example.com/blub').to_s).to eql('example.example.com')
    expect(normalizer.new('   example.example.org   ').to_s).to eql('example.example.org')
  end
end

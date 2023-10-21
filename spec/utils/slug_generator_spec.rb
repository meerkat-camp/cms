describe SlugGenerator do
  describe '#generate' do
    context 'when slug is free' do
      it 'returns the slug' do
        site = create(:site)
        slug_generator = described_class.new(site)

        expect(slug_generator.generate('/foobar')).to eq('/foobar')
      end
    end
  end

  describe 'when slug is taken' do
    it 'proposes an alternative' do
      site = create(:site)
      create(:post, slug: '/foobar', site:)
      create(:page, slug: '/foobar1', site:)

      slug_generator = described_class.new(site)

      expect(slug_generator.generate('/foobar')).to eq('/foobar2')
    end
  end
end

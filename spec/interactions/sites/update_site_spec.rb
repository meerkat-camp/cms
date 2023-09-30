describe Sites::UpdateSite do
  let(:site) { build(:site)}
  let(:current_user) { build(:user) }

  let(:title) { site.title }
  let(:language_code) { site.language_code }
  let(:domain) { site.domain }
  subject(:outcome) {  described_class.run(title:, language_code:, domain:, current_user:, site: ) }

  describe '#valid?' do
    context 'with missing title' do
      let(:title) { nil }

      it 'is invalid' do
        expect(outcome).not_to be_valid
        expect(outcome.errors[:title]).to be_any
      end
    end

    context 'with wrong domain' do
      let(:domain) { "foobaz fanzasf 131" }

      it 'is invalid' do
        expect(outcome).not_to be_valid
        expect(outcome.errors[:domain]).to be_any
      end
    end

    context 'with invalid language_code' do
      let(:language_code) { "foobaz fanzasf 131" }

      it 'is invalid' do
        expect(outcome).not_to be_valid
        expect(outcome.errors[:language_code]).to be_any
      end
    end
  end

  describe '#execute' do
    let(:title) { 'New title' }
    let(:language_code) { 'fr' }
    let(:domain) { 'https://example.example.com' }

    it 'updates the site' do
      expect(outcome.result.title).to eql(title)
      expect(outcome.result.language_code).to eql(language_code)
      expect(outcome.result.domain).to eql("example.example.com")
    end
  end
end

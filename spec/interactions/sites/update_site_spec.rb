describe Sites::UpdateSite do
  subject(:outcome) do
    described_class.execute(
      emoji:,
      title:,
      language_code:,
      domain:,
      current_user:,
      theme_id:,
      site:
    )
  end

  let(:site) { build(:site, theme_id: create(:theme, hugo_theme: 'foobar').id) }
  let(:current_user) { build(:user) }
  let(:theme_id) { site.theme.id }

  describe '#execute' do
    let(:title) { 'New title' }
    let(:language_code) { 'fr' }
    let(:domain) { 'example.example.com' }
    let(:emoji) { '🎉' }

    it 'updates the site' do
      expect(outcome).to be_success
      expect(outcome.site.title).to eql(title)
      expect(outcome.site.language_code).to eql(language_code)
      expect(outcome.site.domain).to eql("example.example.com")
    end
  end
end

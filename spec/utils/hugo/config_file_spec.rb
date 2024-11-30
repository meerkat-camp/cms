describe Hugo::ConfigFile do
  subject(:config_file) { described_class.new(site, deployment_target) }

  let(:deployment_target) { create(:deployment_target) }
  let(:site) { deployment_target.site }

  describe '#relative_path' do
    it 'returns the relative path to the config file' do
      expect(config_file.relative_path).to eq('config.json')
    end
  end

  describe '#content' do
    let(:content) { JSON.parse(config_file.content) }
    let!(:social_media_links) { create_list(:social_media_link, 3, site: site) }

    it 'contains social media links' do
      social_media_links.map do |l|
        expect(config_file.social).to include({ name: l.name, url: l.url, icon: l.icon, svg: l.svg })
      end
    end

    it 'contains navigation links' do
      page = create(:page, title: 'Foobar', slug: 'foobar', emoji: '🦄', site:)
      site.main_navigation.add(page)
      expect(content['menu']['main']).to include(
        {
          "name" => page.title,
          "url" => page.slug,
          "weight" => 1,
          "params" => { "emoji" => page.emoji }
        }
      )
    end
  end
end

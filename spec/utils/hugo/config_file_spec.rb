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
    let!(:social_media_links) { create_list(:social_media_link, 3, site: site) }

    it 'contains social media links' do
      social_media_links.map do |l|
        expect(config_file.social).to include({ name: l.name, url: l.url, icon: l.icon, svg: l.svg })
      end
    end
  end
end

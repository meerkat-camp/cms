describe SocialMediaService do
  describe '#svg' do
    described_class.find_each do |service|
      context "with #{service.icon} as icon" do
        it 'returns an svg icon as text' do
          expect(service.svg).to include('<svg')
        end
      end
    end
  end
end

describe Page do
  subject(:page) { build(:page) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(page).to be_valid
    end

    it "is not valid without a slug" do
      page.slug = nil
      expect(page).not_to be_valid
    end
  end

  describe "#homepage?" do
    subject(:page) { build(:page, slug: '/') }

    context 'when the slug is "/"' do
      it "returns true" do
        expect(page).to be_homepage
      end
    end

    context 'when the slug is not "/"' do
      subject(:page) { build(:page, slug: '/about') }

      it "returns false" do
        expect(page).not_to be_homepage
      end
    end
  end
end

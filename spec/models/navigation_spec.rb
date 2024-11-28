describe Navigation do
  describe '#add' do
    it 'adds a page to the navigation' do
      navigation = create(:navigation)

      page = create(:page, site: navigation.site)

      navigation.add(page)
      expect(navigation).to include(page)
    end

    it 'does not add the same page twice' do
      navigation = create(:navigation)

      page = create(:page, site: navigation.site)

      navigation.add(page)
      navigation.add(page)
      expect(navigation.navigation_items.where(page:).count).to eq(1)
    end
  end

  it 'does not fail if page is not part of navigation' do
    navigation = create(:navigation)

    page = create(:page, site: navigation.site)

    navigation.remove(page)

    expect(navigation).not_to include(page)
  end
end

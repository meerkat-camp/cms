describe 'Post features' do
  describe 'adding a navigation item' do
    it 'adds the item' do
      as_user do |user|
        site = create(:site, users: [user])

        visit site_navigations_path(site)

        within "#navigation_#{site.navigations.find_by(type: 'main').id}" do
          click_on 'Add Item'

          fill_in 'Title', with: 'About me'
          fill_in 'External url', with: '/about-me'
          click_on 'Create Navigation item'

          expect(page).to have_content 'About me'
        end
      end
    end
  end

  describe 'deleting a navigation item' do
    it 'deletes the item' do
      as_user do |user|
        site = create(:site, users: [user])
        item = site.navigations.find_by(type: 'main').navigation_items.create(title: 'About me', external_url: '/about-me')

        visit site_navigations_path(site)

        within "#navigation-item_#{item.id}" do
          click_on 'Delete'
        end

        expect(page).to have_no_content 'About me'
      end
    end
  end
end

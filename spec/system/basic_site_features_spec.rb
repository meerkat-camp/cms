describe 'Basic Site features' do
  describe 'listing all sites' do
    context 'for a user' do
      it 'displays own sites' do
        as_user do |user|
          allowed_site = create(:site, users: [user])
          disallowed_site = create(:site)

          visit root_path

          expect(page).to have_content(allowed_site.title)
          expect(page).not_to have_content(disallowed_site.title)
        end
      end
    end

    context 'for a superadmin' do
      it 'displays all site' do
        as_superadmin do |_admin|
          site = create(:site)

          visit root_path

          expect(page).to have_content(site.title)
        end
      end
    end
  end

  describe 'creating a site as registed user' do
    context 'when user provides a title' do
      it 'creates a new site' do
        as_user do
          visit new_site_path

          fill_in 'Title', with: 'My Site'

          click_button 'Create Site'

          expect(page).to have_content('Site was successfully created.')
          expect(page).to have_content('My Site')
        end
      end
    end

    context 'when user provides no title' do
      it 'shows an error' do
        as_user do
          visit new_site_path

          click_button 'Create Site'

          expect(page).to have_content("can't be blank")
        end
      end
    end
  end
end

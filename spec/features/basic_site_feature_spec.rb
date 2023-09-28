describe 'Basic Site features', type: :feature do
  describe 'listing all sites' do
    context 'as a user' do
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

    context 'as a superadmin' do
      it 'displays all site' do
        as_superadmin do |admin|
          site = create(:site)

          visit root_path

          expect(page).to have_content(site.title)
        end
      end
    end
  end
end

describe 'Navigation Features' do
  describe 'adding a page to the navigation' do
    context 'when on page overview' do
      it 'adds the page to the navigation' do
        as_site_admin do |user|
          site = user.sites.first
          site_page = create(:page, site: site)

          visit site_pages_path(site)

          within_turbo_frame_for(site_page) do
            click_on 'Add to navigation'
          end

          expect(page).to have_text('Page was successfully added to the navigation.')

          within_navigation(site) do
            expect(page).to have_text(site_page.title)
          end
        end
      end
    end

    context 'when creating a page' do
      it 'adds the page to the navigation' do
        as_site_admin do |user|
          site = user.sites.first

          visit new_site_page_path(site)

          fill_in 'Title', with: 'A very new page'
          fill_in 'Slug', with: '/new-page'
          check 'Add to navigation'

          click_on 'Create Page'

          within_navigation(site) do
            expect(page).to have_text('A very new page')
          end
        end
      end
    end

    context 'when editing a page' do
      it 'adds the page to the navigation' do
        as_site_admin do |user|
          site = user.sites.first
          site_page = create(:page, site: site)

          visit edit_site_page_path(site, site_page)

          check 'Add to navigation'
          click_on 'Update Page'

          within_navigation(site) do
            expect(page).to have_text(site_page.title)
          end
        end
      end
    end
  end

  describe 'removing a page from the navigation' do
    context 'when on page overview' do
      it 'removes the page from the navigation' do
        as_site_admin do |user|
          site = user.sites.first
          site_page = create(:page, site: site)
          site.main_navigation.add(site_page)

          visit site_pages_path(site)

          within_turbo_frame_for(NavigationItem.find_by(page: site_page)) do
            click_on 'Remove from navigation'
          end

          expect(page).to have_text('Page was successfully removed from the navigation.')

          within_navigation(site) do
            expect(page).to have_no_text(site_page.title)
          end
        end
      end
    end

    context 'when editing a page' do
      it 'removes the page from the navigation' do
        as_site_admin do |user|
          site = user.sites.first
          site_page = create(:page, site: site)
          site.main_navigation.add(site_page)

          visit edit_site_page_path(site, site_page)

          uncheck 'Add to navigation'
          click_on 'Update Page'

          within_navigation(site) do
            expect(page).to have_no_text(site_page.title)
          end
        end
      end
    end
  end

  describe 'reordering pages in the navigation' do
    context 'when pressing the up button' do
      it 'moves the page up' do
        as_site_admin do |user|
          site = user.sites.first
          page1 = create(:page, site: site)
          page2 = create(:page, site: site)
          site.main_navigation.add(page1)
          site.main_navigation.add(page2)

          visit site_pages_path(site)

          within_turbo_frame_for(NavigationItem.find_by(page: page2)) do
            click_on 'Move up'
          end

          expect(page).to have_text('Page was successfully moved up.')

          within_navigation(site) do
            expect(page.body).to match(/#{page2.title}.*#{page1.title}/m)
          end
        end
      end

      context 'when pressing the down button' do
        it 'moves the page down' do
          as_site_admin do |user|
            site = user.sites.first
            page1 = create(:page, site: site)
            page2 = create(:page, site: site)
            site.main_navigation.add(page1)
            site.main_navigation.add(page2)

            visit site_pages_path(site)

            within_turbo_frame_for(NavigationItem.find_by(page: page1)) do
              click_on 'Move down'
            end

            expect(page).to have_text('Page was successfully moved down.')

            within_navigation(site) do
              expect(page.body).to match(/#{page2.title}.*#{page1.title}/m)
            end
          end
        end
      end
    end
  end

  def within_navigation(site, &)
    within_turbo_frame_for(site.main_navigation, &)
  end
end

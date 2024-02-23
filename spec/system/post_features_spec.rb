describe 'Post features' do
  describe 'listing all posts' do
    it 'show all posts' do
      as_user do |user|
        site = create(:site, users: [user])
        posts = create_list(:post, 2, site:)

        visit site_posts_path(site)

        posts.each do |post|
          expect(page).to have_content(post.title)
        end
      end
    end
  end

  describe 'creating a post' do
    it 'creates a post' do
      as_user do |user|
        site = create(:site, users: [user])

        visit site_posts_path(site)
        click_on '🖊 New Post'

        post_attributes = attributes_for(:post)
        fill_in 'Title', with: post_attributes[:title]
        click_on 'Create Post'

        expect(page).to have_content('Post was successfully created.')
        expect(site.posts).to exist(title: post_attributes[:title])
      end
    end
  end

  describe 'editing a post' do
    it 'updated the post' do
      as_user do |user|
        site = create(:site, users: [user])
        post = create(:post, site:)

        visit site_posts_path(site)
        click_on 'Edit'

        post_attributes = attributes_for(:post)
        fill_in 'Title', with: post_attributes[:title]

        click_on 'Update Post'

        expect(page).to have_content('Post was successfully updated.')
        expect(page).to have_content(post_attributes[:title])
        expect(post.reload.title).to eq(post_attributes[:title])
      end
    end
  end

  describe 'deleting a post' do
    it 'deletes the post' do
      as_user do |user|
        site = create(:site, users: [user])
        post = create(:post, site:)

        visit site_posts_path(site)
        accept_confirm do
          click_on 'Delete'
        end

        expect(page).to have_no_content(post.title)
      end
    end
  end
end

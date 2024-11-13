describe Post do
  describe 'slug validation' do
    context 'with a duplicate slug on the same site' do
      it 'fails validation' do
        site = create(:site)
        create(:post, site: site, slug: '/foo')
        post = build(:post, site: site, slug: '/foo')
        expect(post).not_to be_valid
      end
    end

    context 'with a unique slug on another site' do
      it 'passes validation' do
        create(:post, slug: '/foo')
        post = build(:post, slug: '/foo')
        expect(post).to be_valid
        expect(post.save).to be true
      end
    end

    context 'with invalid characters' do
      it 'fails validation' do
        post = build(:post, slug: 'foo🧭bar')
        expect(post).not_to be_valid
      end
    end

    context 'with an empty slug' do
      it 'passes validation' do
        post = build(:post, slug: '')
        expect(post).to be_valid
        expect(post.save).to be true
      end
    end
  end

  describe 'publishing' do
    context 'when no publish_at timestamp is set' do
      it 'sets the published_at timestamp to the current time' do
        post = create(:post, publish_at: nil)
        expect(post.publish_at).to be_within(1.second).of(Time.current)
      end
    end
  end
end

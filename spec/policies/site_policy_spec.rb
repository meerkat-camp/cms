describe SitePolicy do
  subject(:policy) { described_class }

  permissions :index?, :create? do
    context 'when signed in' do
      it 'returns true' do
        user = build(:user)
        expect(policy).to permit(user, nil)
      end

      context 'when not signed in' do
        it 'returns false' do
          expect(policy).not_to permit(nil, nil)
        end
      end
    end
  end

  permissions :create_social_media_link? do
    let(:site) do
      site = create(:site)
      site.users << user if user
      site
    end
    let(:user) { nil }

    context 'when super admin' do
      let(:user) { build(:user, :superadmin) }

      it 'returns true' do
        expect(policy).to permit(user, nil)
      end
    end

    context 'when user belongs to site' do
      let(:user) { create(:user) }

      it 'returns true' do
        expect(policy).to permit(user, site)
      end
    end

    context 'when user does not belong to site' do
      it 'returns false' do
        any_user = build(:user)
        expect(policy).not_to permit(any_user, site)
      end
    end

    context 'when not signed in' do
      it 'returns false' do
        expect(policy).not_to permit(nil, site)
      end
    end
  end
end

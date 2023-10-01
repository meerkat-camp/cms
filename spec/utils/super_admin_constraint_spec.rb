describe SuperAdminConstraint do
  describe '#matches?' do
    subject { described_class.new.matches?(request) }

    let(:request) { instance_double(Rack::Request, session: { user_id: user.id }) }

    context 'when user is a super admin' do
      let(:user) { create(:user, :superadmin) }

      it { is_expected.to be true }
    end

    context 'when user is not a super admin' do
      let(:user) { create(:user) }

      it { is_expected.to be false }
    end
  end
end

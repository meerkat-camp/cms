require "rails_helper"

RSpec.describe UserMailer do
  describe "#login" do
    let(:user) { build(:user) }
    let(:site) { build(:site) }
    let(:mail) { described_class.with(user:, site:).login }

    it "renders the headers" do
      expect(mail.subject).to eq("Your login-link from meerkat.camp")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["login@meerkat.camp"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Your Login-link from meerkat.camp")
    end
  end
end

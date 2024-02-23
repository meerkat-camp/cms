require 'spec_helper'

describe Hugo::RobotsTxtFile do
  subject(:robots_txt_file) { described_class.new(deployment_target) }

  describe '#write' do
    let(:file_path) { Rails.root.join(deployment_target.build_path, 'content/robots.txt') }
    let(:file_content) { File.read(file_path) }

    before(:each) do
      robots_txt_file.write
    end

    context 'for "staging" deployment targets' do
      let(:deployment_target) { create(:deployment_target, :staging) }

      it 'denies access for robots in the written file' do
        expect(file_content).to eql("User-agent: *\nDisallow: /")
      end
    end

    context 'for "production" deployment targets' do
      let(:deployment_target) { create(:deployment_target, :production) }

      it 'allows acces for robots in the written file' do
        expect(file_content).to eql("User-agent: *\nAllow: /")

      end
    end
  end
end

describe Rclone::Provider::Base do
  let(:deployment_target) { create(:deployment_target) }
  let(:provider) { described_class.new(deployment_target) }

  it 'can not be used directly' do
    expect { provider.rclone_target }.to raise_error(NotImplementedError)
    expect { provider.config_file_content }.to raise_error(NotImplementedError)
  end

  describe '.source_dir' do
    it 'delegates the source dir to the deployment target' do
      expect(provider.source_dir).to eq(deployment_target.source_dir)
    end
  end
end

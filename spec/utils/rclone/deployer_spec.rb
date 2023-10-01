describe Rclone::Deployer do
  subject(:deployer) { described_class.new(site, target, rclone:) }

  let(:rclone) { class_spy(Rclone::CommandRunner) }
  let(:site) { create(:site) }
  let(:target) do
    instance_spy(
      Rclone::Target::Fastmail,
      config_file_path: '/tmp/rclone/1.conf',
      rclone_target: 'fastmail:/files'
    )
  end

  describe '.deploy' do
    it 'deploys a site' do
      deployer.deploy

      expect(target).to have_received(:write_config_file)
      expect(rclone).to have_received(:run).with(
        ["sync", "--config", target.config_file_path, "#{site.hugo_dir}/public/", target.rclone_target],
        { log: true }
      )

      expect(target).to have_received(:delete_config_file)
    end
  end

  context 'when the deployment fails' do
    it 'ensures the config file is deleted' do
      allow(rclone).to receive(:run).and_raise(Rclone::Error)

      expect { deployer.deploy }.to raise_error(Rclone::Error)

      expect(target).to have_received(:delete_config_file)
    end
  end
end

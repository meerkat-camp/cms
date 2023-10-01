describe Rclone::Target::Fastmail do
  subject(:target) { described_class.new(deployment_target, rclone:) }

  let(:deployment_target) do
    create(
      :deployment_target, :fastmail, config: {
        'email' => 'jane@doe.com',
        'password' => 'password',
        'path' => '/path/to/site'
      }
    )
  end

  let(:rclone) do
    class_spy(Rclone::CommandRunner, run: { stdout: 'obscured_password' })
  end

  describe '#write_config_file' do
    it 'writes the config file' do
      target.write_config_file

      expect(File.read(target.config_file_path)).to eq <<~CONFIG
        [fastmail]
        type = webdav
        url = https://webdav.fastmail.com/
        vendor = fastmail
        user = #{deployment_target.config.fetch('email')}
        pass = obscured_password
      CONFIG
      target.delete_config_file
    end
  end

  describe '#delete_config_file' do
    it 'deletes the config file' do
      target.write_config_file
      target.delete_config_file

      expect(File.exist?(target.config_file_path)).to be false
    end
  end

  describe '#rclone_target' do
    it 'returns a target matching the config file' do
      expect(target.rclone_target).to eq 'fastmail:/jane.doe.com/files/path/to/site'
    end
  end
end

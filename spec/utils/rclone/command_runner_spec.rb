describe Rclone::CommandRunner do
  subject(:command) { described_class.new(args, runner:) }

  let(:args) { ['version'] }
  let(:runner) { class_spy(ShellCommand, run: { stdout: 'rclone v1.64.0', stderr: '' }) }

  describe '.run' do
    it 'really works without stubbing' do
      result = described_class.run(['version'])
      expect(result[:stdout]).to include('rclone')
    end
  end

  context 'when the command succeeds' do
    it 'runs the command' do
      command.run

      expect(runner).to have_received(:run).with(
        %w[rclone version],
        { log: false }
      )
    end

    it 'return the output' do
      expect(command.run).to eq({ stdout: 'rclone v1.64.0', stderr: '' })
    end
  end

  context 'when the command is unsuccesful' do
    before do
      allow(runner).to receive(:run).and_raise(ShellCommand::Error.new('error message'))
    end

    it 'raises an error' do
      expect { command.run }.to raise_error(Rclone::Error, 'Failed to run rclone command: error message')
    end
  end
end

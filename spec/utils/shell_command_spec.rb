describe ShellCommand do
  subject(:command) { described_class }

  let(:stdout) { instance_spy(IO, read: 'hi') }
  let(:stderr) { instance_spy(IO, read: '') }
  let(:wait_thr) do
    instance_spy(
      Process::Waiter,
      value: instance_spy(Process::Status, success?: true)
    )
  end

  let(:open3) do
    class_double(
      Open3,
      popen3: [instance_spy(IO), stdout, stderr, wait_thr]
    )
  end
  let(:logger) { instance_spy(Logger) }

  describe '.run' do
    it 'works in reality' do
      result = command.run(%w[echo hi])
      expect(result).to eq(stdout: 'hi', stderr: '')
    end
  end

  context 'when the command succeeds' do
    it 'return the output' do
      result = command.new(%w[echo hi], logger:, open3:).run
      expect(result).to eq(stdout: 'hi', stderr: '')
    end

    context 'with enabled logging' do
      it 'logs the command and result' do
        command.new(%w[echo hi], logger:, open3:).run(log: true)
        expect(logger).to have_received(:info).with(
          "ShellCommand finished: echo hi\nstdout: hi"
        )
      end
    end

    context 'without enabled logging' do
      it 'logs the command and result' do
        command.new(%w[echo hi], logger:, open3:).run
        expect(logger).not_to have_received(:info)
      end
    end
  end

  context 'when the command is unsuccesful' do
    let(:stderr) { instance_spy(IO, read: 'Thid did not work.') }

    it 'raises an error' do
      allow(wait_thr.value).to receive(:success?).and_return(false)
      expect { command.new(['foo'], open3:).run }.to raise_error(
        ShellCommand::Error
      ).with_message("Failed to run foo\nstderr: #{stderr.read}")
    end
  end

  context 'when open3 throws and error' do
    it 'raises an error' do
      allow(open3).to receive(:popen3).and_raise(StandardError)

      expect { command.new(['foo'], open3:).run }.to raise_error(
        ShellCommand::Error
      )
    end
  end
end

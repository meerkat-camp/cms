class ShellCommand
  class Error < StandardError; end

  attr_reader :args, :logger, :open3

  def self.run(args, log: false)
    new(args).run(log:)
  end

  def initialize(args, logger: Rails.logger, open3: Open3)
    @open3 = open3
    @logger = logger
    @args = args
  end

  def run(log: false)
    stdin, stdout, stderr, wait_thr = popen3(args)

    output = { stdout: stdout.read.chomp, stderr: stderr.read.chomp }

    stdin.close
    stdout.close
    stderr.close

    raise_if_error(wait_thr, output)
    log_command_and_result(output) if log

    output
  end

  def popen3(args)
    open3.popen3(*args)
  rescue StandardError => e
    raise_with_nessage e.message
  end

  private

  def raise_if_error(wait_thr, output)
    return if wait_thr.value.success?

    raise_with_nessage "stderr: #{output[:stderr]}"
  end

  def raise_with_nessage(message)
    raise Error, "Failed to run #{args.join(' ')}\n#{message}"
  end

  def log_command_and_result(output)
    message = ["ShellCommand finished: #{args.join(' ')}"]
    message << "stdout: #{output[:stdout]}" if output[:stdout].present?
    message << "stderr: #{output[:stderr]}" if output[:stderr].present?

    logger.info(message.join("\n"))
  end
end

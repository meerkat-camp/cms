module Rclone
  class CommandRunner
    def self.run(args, log: false)
      new(args).run(log:)
    end

    def initialize(args, runner: ShellCommand)
      @args = ["rclone"] + args
      @runner = runner
    end

    def run(log: false)
      @runner.run(@args, log:)
    rescue ShellCommand::Error => e
      raise Error, "Failed to run rclone command: #{e.message}"
    end
  end
end

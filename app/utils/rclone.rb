module Rclone
  class Error < StandardError; end

  PROVIDERS = {
    fastmail: Provider::Fastmail,
    internal: Provider::Internal
  }.freeze
end

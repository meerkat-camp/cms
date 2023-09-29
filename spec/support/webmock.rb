require 'webmock/rspec'

allowed_sites = [
  '0.0.0.0',
  '127.0.0.1',
  'localhost'
].freeze

WebMock.disable_net_connect!(allow: allowed_sites)

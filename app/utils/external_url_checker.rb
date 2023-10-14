class ExternalUrlChecker
  class Error < StandardError; end

  def initialize(url)
    @url = url
  end

  def check!
    parse_url!
    check_schema!
    check_private_ip!

    check_for_forbidden_hostnames!
    check_for_allowed_ports!

    @uri.to_s
  end

  private

  def parse_url!
    @uri = URI.parse(@url)
  rescue URI::InvalidURIError
    fail!('Invalid URL')
  end

  def check_schema!
    return if @uri.is_a?(URI::HTTP)
    return if @uri.is_a?(URI::HTTPS)

    fail!('Forbidden Schema')
  end

  def check_private_ip!
    return unless IPAddr.new(@uri.host).private?

    fail!('Forbidden IP')
  rescue IPAddr::InvalidAddressError
    # no ip so the check is not needed
  end

  def check_for_allowed_ports!
    return unless @uri.port
    return if @uri.port.in?([80, 443])

    fail!('Forbidden Port')
  end

  def check_for_forbidden_hostnames!
    return unless @uri.host == 'localhost'

    fail!('Forbidden hostname')
  end

  def fail!(message)
    raise Error, "#{message}: #{@url}"
  end
end

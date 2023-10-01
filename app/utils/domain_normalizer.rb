class DomainNormalizer
  def initialize(domain)
    domain = domain.downcase.strip
    domain = domain.gsub(%r{^https?://}, '')
    @domain = domain.gsub(%r{/.*$}, '')
  end

  def to_s
    @domain
  end
end

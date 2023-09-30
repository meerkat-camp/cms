class DomainNormalizer
  def initialize(domain)
    domain = domain.downcase.strip
    domain = domain.gsub(/^https?\:\/\//, '')
    @domain = domain.gsub(/\/.*$/, '')
  end

  def to_s
    @domain
  end
end

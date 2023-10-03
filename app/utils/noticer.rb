class Noticer
  attr_reader :site

  def initialize(site)
    @site = site
  end

  def notice(notice)
    Turbo::StreamsChannel.broadcast_append_to(
      site, :notices,
      target: 'notices',
      partial: 'layouts/notice',
      locals: { notice:, site: }
    )
  end
end

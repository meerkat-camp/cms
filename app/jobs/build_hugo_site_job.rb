class BuildHugoSiteJob < ApplicationJob
  queue_as :default

  def perform(site)
    FileUtils.rm_rf(site.hugo_dir)

    files = []
    files << Hugo::ConfigFile.new(site)

    files += site.posts.map { |post| Hugo::PostFile.new(post) }
    files += site.pages.map { |page| Hugo::PageFile.new(page) }
    files += site.images.map { |image| Hugo::ImageFile.new(image) }

    files.map(&:write)

    `ln -s #{Rails.root.join('vendor/themes')} tmp/hugo/#{site.id}`

    Rails.logger.debug `cd tmp/hugo/#{site.id} && hugo`

    preview_path = Rails.root.join('tmp', 'hugo', site.id.to_s, 'public', 'index.html')
    Noticer.new(site).notice("Site built. <a href='file://#{preview_path}'>Preview</a>")
  end
end

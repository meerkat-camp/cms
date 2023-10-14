Rails.application.configure do
  config.good_job = {
    enable_cron: true,
    cron: {
      cleanup_images: {
        cron: '0 3 * * *',
        class: 'CleanupOrphanedImagesJob'
      }
    }
  }
end

class CleanupOrphanedImagesJob < ApplicationJob
  queue_as :default

  def perform
    Image.orphaned.destroy_all
  end
end

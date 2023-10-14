class CleanupOrphanedImagesJob < ApplicationJob
  queue_as :default

  def perform
    Image.orphaned.destroy_all

    Image.where.not(imageable: nil).find_each do |image|
      image.destroy unless public_image_ids(image.imageable).include?(image.public_id)
    end
  end

  private

  def public_image_ids(imageable)
    imageable.blocks.select { |block| block.type == 'image' }.map(&:image_id)
  end
end

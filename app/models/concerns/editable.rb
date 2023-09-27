module Editable
  extend ActiveSupport::Concern

  included do
    has_many :images, as: :imageable, dependent: :destroy
    after_create :assign_images
  end

  def blocks
    Blocks.from_editor_json(content)
  end

  def content_html
    Blocks::Renderer::Html.render(blocks)
  end

  private

  def assign_images
    blocks.select { |block| block.type == 'image' }.each do |block|
      block.image.update(imageable: self)
    end
  end
end

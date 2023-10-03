class Page < ApplicationRecord
  include Editable

  validates :slug, presence: true

  belongs_to :site

  def homepage?
    slug == '/'
  end
end

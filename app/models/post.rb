class Post < ApplicationRecord
  include Editable

  belongs_to :site

  scope :latest, -> { order(created_at: :desc) }
end

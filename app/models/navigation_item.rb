class NavigationItem < ApplicationRecord
  belongs_to :navigation
  belongs_to :parent, class_name: name, optional: true

  has_many :children, class_name: name, foreign_key: :parent_id, dependent: :destroy, inverse_of: :parent
end

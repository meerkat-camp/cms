class Navigation < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :site
  enum type: { main: 'main', footer: 'footer' }
  has_many :navigation_items, dependent: :destroy
end

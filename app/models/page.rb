class Page < ApplicationRecord
  include Editable

  belongs_to :site

  def homepage?
    slug == '/'
  end
end

module Paginatable
  extend ActiveSupport::Concern
  include Pagy::Backend

  included do
    helper_method :pagy
  end
end

class IconComponent < ViewComponent::Base
  def initialize(name:)
    @name = name
  end

  def call
    tag.i(class: "bi bi-#{@name}")
  end
end

module ApplicationHelper
  def component(name, *, **)
    component_class = "#{name.to_s.camelize}Component".constantize
    render(component_class.new(*, **))
  end
end

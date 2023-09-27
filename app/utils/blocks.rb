module Blocks
  MAPPING = {
    'header' => Header,
    'list' => List,
    'image' => Image,
    'paragraph' => Paragraph,
    'quote' => Quote,
    'table' => Table
  }.freeze

  def self.from_editor_json(json)
    return [] if json.blank?

    parsed_json = JSON.parse(json)

    parsed_json.fetch('blocks', []).map do |block_json|
      block_type = "Blocks::#{block_json['type'].classify}".constantize
      block_type.new(id: block_json['id'], data: block_json['data'])
    end
  end
end

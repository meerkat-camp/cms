class ConvertEditorJsJsonToNativeBlockHash < ActiveRecord::Migration[7.1]
  def change
    [Post, Page].each do |model|
      model.find_each do |object|
        if object.content.is_a?(String) && object.content.present?
          object.content = Blocks.from_editor_js(JSON.parse(object.content))
          object.save!
        end
      end
    end
  end
end

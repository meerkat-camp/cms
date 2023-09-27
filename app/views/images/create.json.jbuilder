if @image&.valid?
  json.success 1
  json.file do
    json.url(image_url(@image))
  end
else
  json.success 0
end

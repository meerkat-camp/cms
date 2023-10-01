module Hugo
  class ImageFile < BaseFile
    def binary?
      true
    end

    def relative_path
      "static/images/#{object.id}"
    end

    def content
      File.binread(object.fs_path)
    end
  end
end

describe Image do
  describe 'height / width' do
    it 'returns the height and width of the image' do
      image = build(:image)
      image.file = fixture_file_upload('15x15.jpg', 'image/jpg')
      image.save

      image.file.analyze

      expect(image.height).to eq(15)
      expect(image.width).to eq(15)
    end
  end

  describe 'validations for image' do
    context 'when image is valid' do
      it 'is valid' do
        image = build(:image)
        image.file = fixture_file_upload('15x15.jpg', 'image/jpg')
        expect(image).to be_valid
      end
    end

    context 'when file is no image file format' do
      it 'is invalid' do
        image = build(:image)
        image.file = fixture_file_upload('text.txt', 'text/plain')

        expect(image).not_to be_valid
        expect(image.errors[:file]).to include('must be an image')
      end
    end

    context 'when no image is attached' do
      it 'is invalid' do
        image = build(:image)
        image.file = nil

        expect(image).not_to be_valid
        expect(image.errors[:file]).to include("can't be blank")
      end
    end
  end
end

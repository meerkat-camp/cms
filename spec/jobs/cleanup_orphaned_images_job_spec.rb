describe CleanupOrphanedImagesJob do
  subject(:perform_job) { described_class.perform_now }

  context 'for images that were never attached to an imageable' do
    context 'when older than 2 days' do
      it 'delete the image' do
        image = create(:image, imageable: nil, created_at: 3.days.ago)

        perform_job

        expect(Image).not_to exist(id: image.id)
      end
    end

    context 'when newer than 2 days' do
      it 'keeps the image' do
        image = create(:image, imageable: nil, created_at: 1.day.ago)

        perform_job

        expect(Image).to exist(id: image.id)
      end
    end
  end

  context 'for images that are attached to an imageable' do
    let!(:image) { create(:image, imageable: post) }
    let(:post) { create(:post) }

    context 'when the image is no longer part of the content' do
      it 'deletes the image' do
        perform_job

        expect(Image).not_to exist(id: image.id)
      end
    end

    context 'when the image is still part of the content' do
      before do
        post.update(content: [Blocks::Image.new(id: 'abc', image_id: image.public_id)])
      end

      it 'keeps the image' do
        perform_job
        expect(Image).to exist(id: image.id)
      end
    end
  end
end

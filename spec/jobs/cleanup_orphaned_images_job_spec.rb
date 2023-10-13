describe CleanupOrphanedImagesJob do
  subject(:perform_job) { described_class.perform_now }

  context 'for images that were never attached to an imageable' do
    it 'delete the image' do
      image = create(:image, imageable: nil, created_at: 3.days.ago)

      perform_job

      expect(Image).not_to exist(id: image.id)
    end
  end
end

describe Site do
  describe '.publish' do
    context 'when no target type is specified' do
      it 'publishes to staging' do
        site = create(:site)
        deployment_target = create(:deployment_target, type: :staging, provider: :internal, site:)

        site.publish

        expect(Hugo::BuildJob).to have_been_enqueued.with(deployment_target)
      end
    end
  end
end

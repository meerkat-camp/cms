describe Hugo::BuildJob do
  subject(:job) { described_class }

  let(:deployment_job) { class_spy(Rclone::DeployJob) }
  let(:shell) { class_spy(ShellCommand) }
  let(:deployment_target) { create(:deployment_target, :staging) }
  let(:site) { deployment_target.site }

  it 'writes all files for hugo' do
    site.posts << create(:post)
    site.pages << create(:page)
    site.images << create(:image)

    paths = [
      "/config.json",
      "/content/pages/#{site.pages.first.public_id}.html",
      "/content/posts/#{site.posts.first.public_id}.html",
      "/themes"
    ]

    perform(deployment_target)

    directory_content = Dir.glob("#{deployment_target.build_path}/**/*").map do |p|
      p.gsub(deployment_target.build_path, '')
    end

    paths.each do |path|
      expect(directory_content).to include(path)
    end
  end

  it 'builds the site' do
    perform(deployment_target)
    expect(shell).to have_received(:run).with(
      ['hugo'],
      chdir: deployment_target.build_path,
      log: true
    )
  end

  it 'triggers a deployment job' do
    perform(deployment_target)
    expect(deployment_job).to have_received(:perform_later).with(deployment_target)
  end

  private

  def perform(deployment_target)
    job.perform_now(deployment_target, deployment_job:, shell:)
  end
end

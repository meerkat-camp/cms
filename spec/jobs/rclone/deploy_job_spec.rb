describe Rclone::DeployJob do
  subject(:job) { described_class }

  let(:deployer) { class_spy(Rclone::Deployer) }
  let(:noticer) { instance_spy(Noticer) }
  let(:noticer_class) { class_spy(Noticer, new: noticer) }
  let(:deployment_target) { create(:deployment_target, :staging) }

  it 'deploys the site' do
    perform(deployment_target)
    expect(deployer).to have_received(:deploy).with(deployment_target)
  end

  it 'sends a notification that the deployment was a success' do
    perform(deployment_target)
    expect(noticer_class).to have_received(:new).with(deployment_target.site)
    expect(noticer).to have_received(:notice).with(
      "Site built. <a href='https://#{deployment_target.public_hostname}'>Preview</a>"
    )
  end

  private

  def perform(deployment_target)
    job.perform_now(deployment_target, deployer:, noticer: noticer_class)
  end
end

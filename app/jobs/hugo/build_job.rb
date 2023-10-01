module Hugo
  class BuildJob < ApplicationJob
    queue_as :default

    def perform(deployment_target, shell: ShellCommand, deployment_job: Rclone::DeployJob)
      cleanup(deployment_target)
      write_files(deployment_target)
      symlink_themes(deployment_target)
      run_hugo(deployment_target, shell:)

      deployment_job.perform_later(deployment_target)
    end

    private

    def cleanup(deployment_target)
      FileUtils.rm_rf(deployment_target.build_path)
    end

    def write_files(deployment_target)
      site = deployment_target.site

      files = []
      files << Hugo::ConfigFile.new(site, deployment_target)

      files += site.posts.map { |post| Hugo::PostFile.new(post, deployment_target) }
      files += site.pages.map { |page| Hugo::PageFile.new(page, deployment_target) }
      files += site.images.map { |image| Hugo::ImageFile.new(image, deployment_target) }

      files.each(&:write)
    end

    def symlink_themes(deployment_target)
      theme_path = Rails.root.join("vendor/themes")
      FileUtils.ln_s(theme_path, deployment_target.build_path)
    end

    def run_hugo(deployment_target, shell:)
      shell.run(['hugo'], chdir: deployment_target.build_path, log: true)
    end
  end
end

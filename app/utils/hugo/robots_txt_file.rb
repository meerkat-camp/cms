module Hugo
  class RobotsTxtFile < BaseFile
    def initialize(deployment_target)
      super(nil, deployment_target)
    end

    private

    def content
      lines = ["User-agent: *"]

      lines << if deployment_target.staging?
                 "Disallow: /"
               else
                 "Allow: /"
               end

      lines.join("\n")
    end

    def relative_path
      'content/robots.txt'
    end
  end
end

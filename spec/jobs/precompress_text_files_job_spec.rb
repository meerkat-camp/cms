describe PrecompressTextFilesJob do
  subject(:job) { described_class }

  let(:static_website_path) { Rails.root.join("spec/fixtures/hugo_build") }

  before { cleanup_files }
  after { cleanup_files }

  compression_types = { gzip: 'gz', brotli: 'br' }

  %w[html css js xml txt].each do |source_extension|
    compression_types.each do |compression, extension|
      it "precompesses #{source_extension} files with #{compression}" do
        job.perform_now(static_website_path)

        Dir.glob("#{static_website_path}/**/*.#{source_extension}").each do |file|
          expect(File).to exist("#{file}.#{extension}")
        end
      end
    end
  end

  private

  def cleanup_files
    Dir.glob("#{static_website_path}/**/*.{br,gz}").each { |file| File.delete(file) }
  end
end

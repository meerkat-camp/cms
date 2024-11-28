Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.add_argument("--headless")
    opts.add_argument("--disable-site-isolation-trials")
    opts.add_argument("--window-size=1920,1080")
    opts.add_argument("--disable-search-engine-choice-screen")
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options:)
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless
  end

  config.before(:suite) do
    # cleanup capybara screenshots
    FileUtils.rm_rf(Rails.root.glob('tmp/capybara/*'))

    # Cleanup hugo sites
    FileUtils.rm_rf(Rails.root.glob('tmp/hugo/*'))
    FileUtils.rm_rf(Rails.root.glob('tmp/staging_sites/*'))
  end
end

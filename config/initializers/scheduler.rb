require 'rufus-scheduler'

return if defined?(Rails::Console)
return if File.split($PROGRAM_NAME).last == 'rake'
return if Rails.env.test?
return if File.split($PROGRAM_NAME).last == 'sidekiq'

scheduler = Rufus::Scheduler.singleton

scheduler.every '1m' do
  pids = `ps -ef | grep 'sidekiq [0-9].[0-9].[0-9].*\\[0 of.*stopping' | grep -v grep | tr -s " " | cut -d " " -f 2`
  pids.split("\n").compact.each do |pid|
    `kill -TERM #{pid}`
  end
end

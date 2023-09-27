namespace :sidekiq do
  desc "Kill finished sidekiq processes"
  task kill_finished: :environment do
    pids = `ps -ef | grep 'sidekiq [0-9].[0-9].[0-9].*\\[0 of.*stopping' | grep -v grep | tr -s " " | cut -d " " -f 2`
    pids.split("\n").compact.each do |pid|
      `kill -TERM #{pid}`
    end
  end
end

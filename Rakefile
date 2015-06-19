task default: %w[run_server]

task :run_server do
  sh 'rackup -q'
end

task :migrate do
  sh 'sequel -m lib/migrations postgres://localhost/kalender_development'
  sh 'sequel -m lib/migrations postgres://localhost/kalender_test'
end

task :reset_db do
  sh 'sequel -m lib/migrations -M 0 postgres://localhost/kalender_development'
  sh 'sequel -m lib/migrations -M 0 postgres://localhost/kalender_test'
end


worker_processes 4
working_directory "/home/ninja/www/production"

listen "/home/ninja/www/production/tmp/sockets/unicorn.sock", :backlog => 64
pid "/home/ninja/www/production/tmp/pids/unicorn.pid"

timeout 30

stderr_path "/home/ninja/www/production/log/unicorn.stderr.log"
stdout_path "/home/ninja/www/production/log/unicorn.stdout.log"

preload_app true
check_client_connection false

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

before_fork do |server, worker|
        defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
        defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

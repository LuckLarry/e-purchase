set :target_access, "rails@122.112.215.179"

role :app, [ "#{fetch(:target_access)}" ]
role :web, [ "#{fetch(:target_access)}" ]
role :db,  [ "#{fetch(:target_access)}" ]

set :stage, :production
set :branch, :production
set :log_level, :debug


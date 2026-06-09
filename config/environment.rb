require "dotenv/load"
require "sinatra"

# Sinatra configs
set :views, File.expand_path("../views", __dir__)
set :public_folder, File.join(__dir__, "public")
set :show_exceptions, false # não "explodir" quando tiver exceção
set :dump_errors, false     # omita a stacktrace
set :session_secret, ENV.fetch("SESSION_SECRET")
enable :sessions

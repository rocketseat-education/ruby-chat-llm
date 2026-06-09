require "sinatra"

# Sinatra configs
set :views, File.expand_path("../views", __dir__)
set :show_exceptions, false # não "explodir" quando tiver exceção
set :dump_errors, false     # omita a stacktrace
enable :sessions

require "dotenv/load"
require "sinatra"
require "sinatra/activerecord"

require "ruby_llm"
require "ruby_llm/active_record/acts_as"
require "ruby_llm/active_record/chat_methods"
require "ruby_llm/active_record/message_methods"
require "ruby_llm/active_record/model_methods"
require "ruby_llm/active_record/tool_call_methods"
require "ruby_llm/active_record/payload_helpers"
require "redcarpet"

# Sinatra configs
set :views, File.expand_path("../views", __dir__)
set :public_folder, File.expand_path("../public", __dir__)
set :show_exceptions, false # não "explodir" quando tiver exceção
set :dump_errors, false     # omita a stacktrace
set :session_secret, ENV.fetch("SESSION_SECRET")
set :database, { adapter: "sqlite3", database: "db/rocketchat.sqlite3" }

enable :sessions

# RubyLLM
ActiveRecord::Base.include(RubyLLM::ActiveRecord::ActsAs)

RubyLLM.configure do |config|
  config.gemini_api_key = ENV.fetch("GEMINI_API_KEY")
  config.use_new_acts_as = true
end

require_relative "../models/chat"
require_relative "../models/message"
require_relative "../models/tool_call"
require_relative "../models/model"

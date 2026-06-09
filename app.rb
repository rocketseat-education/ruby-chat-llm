require_relative "./config/environment"
require_relative "./config/helpers"

get "/" do
  redirect "/chats"
end

get "/chats" do
  if json?
    content_type :json
    [ { id: 1 } ].to_json
  else
    erb :index
  end
end

get "/new" do
  if json?
    content_type :json
    [ { message: "new" } ].to_json
  end
end

post "/chats" do
  if json?
    content_type :json
    [ { message: "post" } ].to_json
  end
end

get "/chats/:id" do
  if json?
    content_type :json
    [ { message: params[:id] } ].to_json
  end
end

post "/chats/:id/messages" do
  if json?
    content_type :json
    [ { message: "updated" } ].to_json
  end
end

delete "/chats/:id" do
  if json?
    content_type :json
    [ { message: "deleted" } ].to_json
  end
end

get "/refresh" do
  if json?
    content_type :json
    [ { message: "refreshed" } ].to_json
  end
end

get "/chats/:id/messages" do
  if json?
    content_type :json
    [ { id: 1, content: "this is the content" } ].to_json
  end
end

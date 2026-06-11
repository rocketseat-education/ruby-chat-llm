require_relative "./config/environment"
require_relative "./config/helpers"
require_relative "./config/exceptions"

get "/" do
  redirect "/chats"
end

get "/chats" do
  @chats = Chat.all.order("created_at DESC")

  if json?
    content_type :json
    @chats.map { ChatPresenter.call(it) }.to_json
  else
    erb :index
  end
end

get "/new" do
  erb :new
end

post "/chats" do
  msg = params[:content].to_s.strip
  raise "Mensagem não pode estar vazia" if msg.blank?

  @chat = Chat.create!(model_id: Chat::DEFAULT_MODEL)
  @chat.ask(msg)

  if json?
    content_type :json
    ChatPresenter.call(@chat).to_json
  else
    redirect "/chats/#{@chat.id}#new-message"
  end
end

get "/chats/:id" do
  @chat = Chat.find_by(id: params[:id])
  raise ChatNotFound unless @chat

  if json?
    content_type :json
    ChatPresenter.call(@chat).to_json
  else
    erb :show
  end
end

post "/chats/:id/messages" do
  msg = params[:content].to_s.strip
  raise "Mensagem não pode estar vazia" if msg.blank?

  @chat = Chat.find_by(id: params[:id])
  raise ChatNotFound unless @chat

  @chat.ask(msg)

  if json?
    content_type :json
    ChatPresenter.call(@chat).to_json
  else
    redirect "/chats/#{@chat.id}#new-message"
  end
end

delete "/chats/:id" do
  @chat = Chat.find_by(id: params[:id])
  raise ChatNotFound unless @chat

  @chat.destroy

  if json?
    content_type :json
    [ { message: "Apagado" } ].to_json
  else
    redirect "/chats"
  end
end

get "/refresh" do
  Model.refresh!
  @count = Model.count

  if json?
    content_type :json
    [ { message: "#{@count} modelos carregados" } ].to_json
  else
    erb :refresh
  end
end

get "/chats/:id/messages" do
  if json?
    content_type :json
    [ { id: 1, content: "this is the content" } ].to_json
  end
end

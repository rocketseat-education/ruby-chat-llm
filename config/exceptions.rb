class ChatNotFound < StandardError; end

error ChatNotFound do
  if json?
    content_type :json
    status 404
    { message: "Não encontrado" }.to_json
  else
    session[:error] = "Não encontrado"
    redirect "/chats"
  end
end

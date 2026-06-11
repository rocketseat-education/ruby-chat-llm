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

error do
  exc = env["sinatra.error"]

  if json?
    status 500
    { error: exc.message }.to_json
  else
    session[:error] = "Erro na aplicação: #{exc.message}"
  end
end

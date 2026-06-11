class ChatPresenter
  def self.call(chat)
    {
      id: chat.id,
      model_id: chat.model_id,
      created_at: chat.created_at,
      messages: chat.messages.visible.map do |msg|
        {
          role: msg.role,
          content: msg.content,
          input_tokens: msg.input_tokens,
          output_tokens: msg.output_tokens,
        }
      end
    }
  end
end

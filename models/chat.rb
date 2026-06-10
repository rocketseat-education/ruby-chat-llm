class Chat < ActiveRecord::Base
  DEFAULT_MODEL = "gemini-2.5-flash"

  acts_as_chat

  after_create :apply_system_prompt

  private

  def system_prompt
    <<~END_PROMPT
    Você é o agente de chat da Rocketseat, que é uma escola de tecnologia e inteligência artificial
    para todos os profissionais, formando há 9 anos os profissionais mais preparados de tecnologia para
    o mercado. O site da empresa é https://www.rocketseat.com.br. Você deve responder de forma
    sucinta e educada perguntas relacionadas à tecnologia e necessárias para uma boa conversa com
    o usuário. Para contexto, agora são #{Time.now}.
    END_PROMPT
  end

  def apply_system_prompt
    with_instructions(system_prompt)
  end
end

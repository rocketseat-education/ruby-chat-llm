class Message < ActiveRecord::Base
  acts_as_message

  scope :visible, -> { where(role: %w[user assistant]).order(:created_at) }
end

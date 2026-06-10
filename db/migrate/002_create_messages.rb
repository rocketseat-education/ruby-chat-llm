class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :tool_call, foreign_key: true
      t.string :role
      t.text :content
      t.text :content_raw
      t.string :model_id
      t.integer :input_tokens
      t.integer :output_tokens
      t.integer :cached_tokens
      t.integer :cache_creation_tokens
      t.timestamps
    end
  end
end

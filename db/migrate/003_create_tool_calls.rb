class CreateToolCalls < ActiveRecord::Migration[8.1]
  def change
    create_table :tool_calls do |t|
      t.string :tool_call_id
      t.string :name
      t.text :thought_signature
      t.text :arguments
      t.integer :message_id
      t.timestamps
    end
  end
end

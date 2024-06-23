class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.references :sender, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.text :message
      t.boolean :read
      t.timestamps
    end

    add_foreign_key :chats, :users, column: :sender_id
    add_foreign_key :chats, :users, column: :receiver_id
  end
end

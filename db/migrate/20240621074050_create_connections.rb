class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :partner, null: false, foreign_key: { to_table: :users }
      t.string :status
      t.timestamps
    end
  end
end

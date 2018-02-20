class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.references :user, index: true, foreign_key: true
      t.references :connected_user, index: true

      t.timestamps null: false
    end

    add_foreign_key :connections, :users, column: :connected_user_id
    add_index :connections, [:user_id, :connected_user_id], unique: true
  end
end

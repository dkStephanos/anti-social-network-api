class AddAvatarUrlAndBioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :bio, :text
  end
end

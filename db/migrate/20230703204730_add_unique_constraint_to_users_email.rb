class AddUniqueConstraintToUsersEmail < ActiveRecord::Migration[6.1]
  def up
    remove_index :users, :email
    change_column :users, :email, :string, unique: true, null: false
    add_index :users, 'LOWER(email)', unique: true, name: 'index_users_on_lower_email'
  end
end

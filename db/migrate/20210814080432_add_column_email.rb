class AddColumnEmail < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, after: :encrypted_password
  end
end

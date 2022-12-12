class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, default: 'name@example.com', null: false
  end
end

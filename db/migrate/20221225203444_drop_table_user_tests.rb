class DropTableUserTests < ActiveRecord::Migration[6.1]
  def up
    drop_table :user_tests, if_exists: true
  end

  def down
  end
end

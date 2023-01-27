class AddPassedToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :passed, :boolean, default: false, null: false
  end
end

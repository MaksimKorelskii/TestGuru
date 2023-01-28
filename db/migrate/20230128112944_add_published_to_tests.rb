class AddPublishedToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :published, :boolean, default: false, null: false
  end
end

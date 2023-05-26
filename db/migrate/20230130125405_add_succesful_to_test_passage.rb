class AddSuccesfulToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :successful, :boolean, default: false
  end
end

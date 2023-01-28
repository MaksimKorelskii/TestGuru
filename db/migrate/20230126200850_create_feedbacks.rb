class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

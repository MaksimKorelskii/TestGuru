class BadgeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_users do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
    end
  end
end

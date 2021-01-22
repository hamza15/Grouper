class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.references :user, foreign_key: true 
      t.references :group, foreign_key: true
    end
  end
end

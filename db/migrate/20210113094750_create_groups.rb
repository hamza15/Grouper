class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.text :rules
      t.belongs_to :user, foreign_key: true
    end
  end
end

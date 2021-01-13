class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.text :rules
      t.integer :user_count
      t.datetime :creation_date
    end
  end
end

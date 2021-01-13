class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :profession
      t.integer :years_of_experience
      t.text :skills
      t.timestamps
    end
  end
end

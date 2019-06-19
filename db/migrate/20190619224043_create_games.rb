class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :system
      t.string :status
      t.string :comment
      t.date :date
      t.float :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.string :description
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :address

      t.timestamps
    end
  end
end

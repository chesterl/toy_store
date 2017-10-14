class CreateToys < ActiveRecord::Migration[5.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.belongs_to :seller, foreign_key: true

      t.timestamps
    end
  end
end

class AddImageToToys < ActiveRecord::Migration[5.0]
  def change
    add_column :toys, :image, :string
  end
end

class AddLocationToSeller < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :street, :string
    add_column :sellers, :suburb, :string
    add_column :sellers, :state, :string
    add_column :sellers, :postcode, :string
    add_column :sellers, :country, :string
  end
end

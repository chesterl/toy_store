class AddStateToToys < ActiveRecord::Migration[5.0]
  def change
    add_column :toys, :state, :string
  end
end

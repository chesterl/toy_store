class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :from, foreign_key: { to_table: :users }
      t.belongs_to :to, foreign_key: { to_table: :users }
      t.string :content

      t.timestamps
    end
  end
end

class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

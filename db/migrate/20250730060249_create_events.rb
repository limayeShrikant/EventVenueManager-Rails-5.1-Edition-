class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :venue, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

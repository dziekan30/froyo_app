class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.string :category
      t.string :location
      t.text :description
      t.integer :start_time
      t.integer :end_time
      t.boolean :buffer, default: false

      t.timestamps
    end
  end
end

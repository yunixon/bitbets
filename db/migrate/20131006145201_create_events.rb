class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type
      t.string :name
      t.string :first_side
      t.string :second_side
      t.datetime :dt_start
      t.boolean :complete
      t.integer :complete_type
      t.string :fact_link

      t.timestamps
    end
  end
end

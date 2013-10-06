class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.string :name
      t.datetime :dt_start
      t.boolean :complete
      t.integer :complete_type
      t.string :fact_link

      t.timestamps
    end
  end
end

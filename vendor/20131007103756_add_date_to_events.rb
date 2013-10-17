class AddDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date_start, :date 
  end
end

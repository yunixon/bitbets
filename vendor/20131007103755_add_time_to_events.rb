class AddTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :time_start, :time
  end
end

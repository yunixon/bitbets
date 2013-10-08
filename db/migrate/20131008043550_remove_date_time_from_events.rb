class RemoveDateTimeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :date_start, :date
    remove_column :events, :time_start, :time
  end
end

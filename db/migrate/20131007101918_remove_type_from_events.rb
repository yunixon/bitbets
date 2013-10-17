class RemoveTypeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :type, :integer
    remove_column :events, :date, :date
    remove_column :events, :time, :time
  end
end

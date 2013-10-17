class AddDateTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :dt_start, :datetime
  end
end

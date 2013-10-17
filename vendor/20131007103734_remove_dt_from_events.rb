class RemoveDtFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :dt_start, :DateTime
  end
end

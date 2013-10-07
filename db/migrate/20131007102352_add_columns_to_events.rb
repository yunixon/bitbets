class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_type, :integer
    add_column :events, :first_side, :string
    add_column :events, :second_side, :string
  end
end

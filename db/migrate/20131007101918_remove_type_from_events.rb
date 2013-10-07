class RemoveTypeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :type, :integer
  end
end

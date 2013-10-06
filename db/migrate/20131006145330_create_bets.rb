class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :win_type
      t.float :sum

      t.timestamps
    end
  end
end

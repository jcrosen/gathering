class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.datetime :date_time, :null => false
      t.gathering_id :integer, :null => false
    end
  end

  def down
    drop_table :events
  end
end

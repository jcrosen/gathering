class CreateGatherings < ActiveRecord::Migration
  def up
    create_table :gatherings do |t|
      t.string :name, :null => false
      t.string :type, :null => false
      t.text :description, :null => false
    end
  end

  def down
    drop_table :gatherings
  end
end

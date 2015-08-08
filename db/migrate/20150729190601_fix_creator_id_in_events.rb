class FixCreatorIdInEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :creator
      t.string :creator_id
      t.index :creator_id
    end
  end
end

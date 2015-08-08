class AddForeignKeyToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :creator
      t.index :creator
    end
  end
end

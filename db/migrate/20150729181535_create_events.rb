class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :date
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end

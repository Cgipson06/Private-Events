class AddInvites < ActiveRecord::Migration
  def change
    change_table :invites do |t|
      t.integer :attendee_id
      t.integer :attended_event_id
    end
  end
end

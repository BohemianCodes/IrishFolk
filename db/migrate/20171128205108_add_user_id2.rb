class AddUserId2 < ActiveRecord::Migration[5.1]
  def change
    change_table :videos do |t|
      t.references :user, foreign_key: true
    end
  end
end

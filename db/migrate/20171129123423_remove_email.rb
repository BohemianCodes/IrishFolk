class RemoveEmail < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :email
    end
  end
end

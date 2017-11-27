class AddYoutubeId < ActiveRecord::Migration[5.1]
  def change

    add_column :videos, :uid, :string
    add_index :videos, :uid
  end
end

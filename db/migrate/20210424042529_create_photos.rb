class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :img_url
      t.string :description
      t.string :public
      t.integer :likes_count
      t.timestamps
    end
  end
end

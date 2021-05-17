class ChangeLikesCountFromPhotos < ActiveRecord::Migration[6.1]
  def change
    change_column :photos, :likes_count, :integer, :default => 0
  end
end

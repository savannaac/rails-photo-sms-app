class AddTypeToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :type, :string
  end
end

class AddImageToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :image, :string
  end
end

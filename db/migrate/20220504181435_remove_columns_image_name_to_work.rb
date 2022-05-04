class RemoveColumnsImageNameToWork < ActiveRecord::Migration[7.0]
  def change
    remove_column :works , :image_name, :string
  end
end

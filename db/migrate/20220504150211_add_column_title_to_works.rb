class AddColumnTitleToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :title, :string
  end
end

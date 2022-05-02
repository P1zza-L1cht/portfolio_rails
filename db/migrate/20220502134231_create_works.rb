class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :image_name
      t.integer :user_id
      

      t.timestamps
    end
  end
end

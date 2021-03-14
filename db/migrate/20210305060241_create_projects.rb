class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.text :image_data

      t.timestamps
    end
  end
end

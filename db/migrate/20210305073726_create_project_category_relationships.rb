class CreateProjectCategoryRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :project_category_relationships do |t|
      t.integer :category_id
      t.integer :project_id
      t.timestamps
    end
  end
end

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.float :salary
      t.float :rating
      t.integer :role
      t.references :superior, index: true
      t.timestamps
    end
  end
end

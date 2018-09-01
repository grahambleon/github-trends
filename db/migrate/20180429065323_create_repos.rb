class CreateRepos < ActiveRecord::Migration[5.2]
  def change
    create_table :repos do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :language
      
      t.timestamps
    end
  end
end

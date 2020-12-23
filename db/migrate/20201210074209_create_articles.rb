class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name,      null: false
      t.text :description, null: false
      t.text :url, null:false
      t.text :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

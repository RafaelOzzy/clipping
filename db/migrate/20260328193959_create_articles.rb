class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :published_at
      t.references :source, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end

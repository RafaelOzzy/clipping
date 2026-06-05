class CreateNewsletters < ActiveRecord::Migration[7.1]
  def change
    create_table :newsletters do |t|
      t.string :title
      t.datetime :sent_at
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end

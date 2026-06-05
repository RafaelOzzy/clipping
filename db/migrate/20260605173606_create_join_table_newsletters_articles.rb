class CreateJoinTableNewslettersArticles < ActiveRecord::Migration[7.1]
  def change
    create_join_table :newsletters, :articles do |t|
      t.index [:newsletter_id, :article_id]
      t.index [:article_id, :newsletter_id]
    end
  end
end

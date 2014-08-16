class CreateArticlesPublishers < ActiveRecord::Migration
  def change
    create_table :articles_publishers do |t|
      t.integer :article_id, null:false
      t.integer :publisher_id, null:false
      t.boolean :buy_request, null:false, default: false
      t.boolean :buy_approval, null:false, default: false
      t.timestamps
    end
  end
end

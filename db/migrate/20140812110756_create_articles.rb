class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id, index: true,null:false
      t.string :name,null:false
      t.string :content,null:false
      t.boolean :author_approval, null:false, default: false
      t.boolean :admin_approval, null:false, default: false

      t.timestamps
    end
  end
end

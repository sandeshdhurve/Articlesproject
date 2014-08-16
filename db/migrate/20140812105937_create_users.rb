class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, presence:true
      t.string :role

      t.timestamps
    end
  end
end

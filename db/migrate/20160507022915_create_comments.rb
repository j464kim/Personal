class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :msg

      t.timestamps null: false
    end
  end
end

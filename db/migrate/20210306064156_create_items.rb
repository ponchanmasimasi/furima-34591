class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text   :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :postage_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :preparation_id, null: false
      t.integer :value, null: false
      t.references :user,foreign_key:true

      t.timestamps
    end
  end
end

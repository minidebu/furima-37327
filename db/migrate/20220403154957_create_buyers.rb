class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :post_code ,null: false
      t.integer :prefecture_id,null: false
      t.string :municipality,null: false
      t.string :address,null: false
      t.string :building
      t.string :phone,null: false
      t.references :buy_record ,null: false ,foreign_key: true
      t.timestamps
    end
  end
end
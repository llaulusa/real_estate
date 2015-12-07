class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :price
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.integer :status
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :buyer_id

      t.timestamps null: false
    end
  end
end

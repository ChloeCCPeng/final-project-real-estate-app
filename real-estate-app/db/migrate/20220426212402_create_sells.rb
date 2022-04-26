class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.integer :seller_id
      t.integer :browser_id

      t.timestamps
    end
  end
end

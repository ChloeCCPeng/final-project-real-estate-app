class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :LotSizeAcres
      t.integer :LotSizeSquareFeet

      t.timestamps
    end
  end
end

class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.integer :amount

      t.timestamps
    end
  end
end

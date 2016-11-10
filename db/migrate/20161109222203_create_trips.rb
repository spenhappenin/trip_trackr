class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :length
      t.float :expense
      t.string :date
  

      t.timestamps
    end
  end
end

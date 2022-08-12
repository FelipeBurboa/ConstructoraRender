class CreateConstructions < ActiveRecord::Migration[7.0]
  def change
    create_table :constructions do |t|
      t.string :name
      t.date :startdate
      t.date :enddate
      t.integer :cost
      t.string :street
      t.string :number
      t.string :city
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end

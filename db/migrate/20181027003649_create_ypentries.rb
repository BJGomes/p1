class CreateYpentries < ActiveRecord::Migration[5.2]
  def change
    create_table :ypentries do |t|
      t.text :name
      t.text :phone
      t.text :address
      t.text :zip
      t.text :parish

      t.timestamps
    end
  end
end

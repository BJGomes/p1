class AddLatitudeToYpentries < ActiveRecord::Migration[5.2]
  def change
    add_column :ypentries, :latitude, :float
  end
end

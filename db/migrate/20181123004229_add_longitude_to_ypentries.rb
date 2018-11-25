class AddLongitudeToYpentries < ActiveRecord::Migration[5.2]
  def change
    add_column :ypentries, :longitude, :float
  end
end

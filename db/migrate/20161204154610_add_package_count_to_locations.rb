class AddPackageCountToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :packages_count, :integer
  end
end

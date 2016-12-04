class AddPackageCountToResidents < ActiveRecord::Migration[5.0]
  def change
    add_column :residents, :packages_count, :integer
  end
end

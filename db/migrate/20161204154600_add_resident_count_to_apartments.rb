class AddResidentCountToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :residents_count, :integer
  end
end

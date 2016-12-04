class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :apartment_number

      t.timestamps

    end
  end
end

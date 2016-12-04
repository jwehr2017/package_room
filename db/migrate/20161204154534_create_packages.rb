class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :location_id
      t.integer :resident_id
      t.datetime :contact_time
      t.string :contact_type
      t.integer :employee_id

      t.timestamps

    end
  end
end

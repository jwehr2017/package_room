class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.integer :apartment_id
      t.string :phone_number
      t.string :email_address
      t.integer :user_id
      t.string :name

      t.timestamps

    end
  end
end

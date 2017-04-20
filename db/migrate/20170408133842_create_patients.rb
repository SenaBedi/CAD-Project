class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.date :DOB
      t.string :address
      t.string :phone
      t.string :infection
      t.timestamps
    end
  end
end

class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :physician_name
      t.timestamps
    end
  end
end

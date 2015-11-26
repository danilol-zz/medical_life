class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :website
      t.integer :crm_number
      t.text :address
      t.string :phone1
      t.string :phone2
      t.text :comments

      t.timestamps
    end
  end
end

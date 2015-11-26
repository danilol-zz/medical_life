class CreateDoctorsSpecializations < ActiveRecord::Migration
  def change
    create_table :doctors_specializations do |t|
      t.integer :doctor_id
      t.integer :specialization_id
    end
  end
end

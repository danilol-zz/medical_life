class CreateMedicalConsultations < ActiveRecord::Migration
  def change
    create_table :medical_consultations do |t|
      t.integer :doctor_id
      t.integer :specialization_id
      t.datetime :date
      t.text :syntoms
      t.text :reason
      t.text :medical_opinion
      t.text :prescription
      t.text :ordered_tests

      t.timestamps
    end
  end
end

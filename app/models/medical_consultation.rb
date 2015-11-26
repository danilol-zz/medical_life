class MedicalConsultation < ActiveRecord::Base

  validates_presence_of :doctor_id
  validates_presence_of :date
  validates_presence_of :prescription

  belongs_to :doctor
end

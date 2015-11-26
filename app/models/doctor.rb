class Doctor < ActiveRecord::Base

  validates_presence_of   :name, :email, :crm_number
  validates_uniqueness_of :name, :email, :crm_number

  has_and_belongs_to_many :specializations
end

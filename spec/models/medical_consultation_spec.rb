require 'rails_helper'

RSpec.describe MedicalConsultation, :type => :model do
  describe 'attribute validations' do
    subject { FactoryGirl.build(:medical_consultation)  }

    it { expect(subject).to validate_presence_of(:date) }
    it { expect(subject).to validate_presence_of(:doctor_id) }
    it { expect(subject).to validate_presence_of(:prescription) }
  end
end

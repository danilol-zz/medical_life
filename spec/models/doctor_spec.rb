require 'rails_helper'

RSpec.describe Doctor, :type => :model do

  describe 'attribute validations' do
    subject { FactoryGirl.build(:doctor)  }

    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:email) }
    it { expect(subject).to validate_presence_of(:crm_number) }
    it { expect(subject).to validate_uniqueness_of(:name) }
    it { expect(subject).to validate_uniqueness_of(:email) }
    it { expect(subject).to validate_uniqueness_of(:crm_number) }
  end

  context "specialization relationship" do
    before do
      s1 = FactoryGirl.create(:specialization, description: "s1")
      s2 = FactoryGirl.create(:specialization, description: "s2")
      s3 = FactoryGirl.create(:specialization, description: "s3")
      @doctor = FactoryGirl.create(:doctor, specializations: [s1, s2, s3])
    end

    it "has relationship" do
      expect(@doctor.specializations.count).to eq 3
      expect(@doctor.specializations.map(&:description)).to include "s1", "s2", "s3"
    end
  end
end

require 'rails_helper'

RSpec.describe Specialization, :type => :model do
  describe 'attribute validations' do
    subject { FactoryGirl.build(:specialization)  }

    it { expect(subject).to validate_presence_of(:description) }
  end
end

FactoryGirl.define do
  factory :medical_consultation do
    doctor_id 1
    date "2015-02-21 14:19:29"
    syntoms "MyText"
    specialization_id 1
    reason "MyText"
    medical_opinion "MyText"
    prescription "MyText"
    ordered_tests "MyText"
  end
end

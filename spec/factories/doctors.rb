FactoryGirl.define do
  factory :doctor do
    sequence(:id) { |n| n }
    name "doctor name"
    email "doctor@doctor.com"
    website "doctor.com"
    crm_number "123123"
    address "address doctor"
    phone1 "phone 1"
    phone2 "phone 2"
    comments "doctor comment"
  end
end

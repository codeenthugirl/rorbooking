FactoryGirl.define do
  factory :secure_meeting do |u|
    u.starts_at '2010-11-05'.to_date
    u.ends_at '2010-11-08'.to_date
  end
end

require 'faker'
FactoryGirl.define do
  factory :consultant do |f|
    f.name { Faker::Name.name }
    f.default_rate { Random.rand(15..150) }
  end
  factory :customer do |f|
    f.name { Faker::Company.name }
    f.default_discount { Random.rand(10..20) }
  end
  factory :invoice do |f|
    f.short_desc { Faker::Lorem.sentence }
  end

  factory :invoice_items do |f|
    f.association customer
    f.assoctiaton consultant
    f.date { Random.rand(1..30).days.ago }
    f.minutes { Random.rand(30..480) }
    f.rate { Rand.rand(15..150) }
  end
end
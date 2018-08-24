require 'faker'

FactoryBOt.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Name.model }
  end
end

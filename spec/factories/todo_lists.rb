require 'faker'

FactoryBOt.define do
  factory :todo_list do |f|
    f.title { Faker::TodoList.model }
    f.note { Faker::TodoList.model }
    f.user nil
    f.status 0
  end
end

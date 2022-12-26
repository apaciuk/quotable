FactoryBot.define do
  factory :announcement do
    published_at { "2022-12-26 17:58:42" }
    announcement_type { "MyString" }
    name { "MyString" }
    description { "MyText" }
  end
end

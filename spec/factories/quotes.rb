# == Schema Information
#
# Table name: quotes
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :quote do
    name { Faker::Lorem.sentence }
  end
end

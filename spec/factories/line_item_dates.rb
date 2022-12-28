# == Schema Information
#
# Table name: line_item_dates
#
#  id         :uuid             not null, primary key
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quote_id   :uuid             not null
#
# Indexes
#
#  index_line_item_dates_on_date               (date)
#  index_line_item_dates_on_date_and_quote_id  (date,quote_id) UNIQUE
#  index_line_item_dates_on_quote_id           (quote_id)
#
# Foreign Keys
#
#  fk_rails_...  (quote_id => quotes.id)
#
FactoryBot.define do
  factory :line_item_date do
    quote { nil }
    date { "2022-12-27" }
  end
end

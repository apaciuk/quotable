# == Schema Information
#
# Table name: quotes
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quote < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    belongs_to :user, optional: true
    before_create { |quote| quote.name = quote.name.titleize  }

    scope :ordered, -> { order(id: :desc) }
    
    broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

   

end

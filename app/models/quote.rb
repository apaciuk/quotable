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
    validates :name, presence: true

    scope :ordered, -> { order(id: :desc) }
    
    broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

end

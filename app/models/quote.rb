# == Schema Information
#
# Table name: quotes
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :uuid
#
# Indexes
#
#  index_quotes_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Quote < ApplicationRecord
    validates :name, presence: true
    belongs_to :company, optional: true

    scope :ordered, -> { order(id: :desc) }
    
    broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

end

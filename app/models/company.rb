# == Schema Information
#
# Table name: companies
#
#  id         :uuid             not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
    validates :name, presence: true
    has_many :quotes, dependent: :destroy
    has_many :users, dependent: :destroy
end

# == Schema Information
#
# Table name: quotes
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Quote, type: :model do
  let(:quote) {FactoryBot.build(:quote)}
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(quote).to be_valid
    end
  end

  context 'Creating a new quote' do
    it 'saves the quote' do
      expect(quote.save).to eq(true)
    end

    it 'does not save the quote without a name' do
      quote.name = nil
      expect(quote.save).to eq(false)
    end
  end



end
